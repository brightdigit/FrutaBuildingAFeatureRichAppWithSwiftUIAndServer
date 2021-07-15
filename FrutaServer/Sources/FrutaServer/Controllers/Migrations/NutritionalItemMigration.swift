import Fluent
import Vapor
import Foundation
import FrutaKit

enum ServerError : Error {
  case missingFile(String)
}

struct NutritionalItemMigration: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema(NutritionalItem.schema)
      .id()
      .field("identifier", .string, .required)
      .field("localizedFoodItemName", .string, .required)
      .field("referenceMass", .double, .required)
      .field("densityMass", .double, .required)
      .field("densityVolume", .double, .required)
      .field("totalSaturatedFat", .double, .required)
      .field("totalMonounsaturatedFat", .double, .required)
      .field("totalPolyunsaturatedFat", .double, .required)
      .field("cholesterol", .double, .required)
      .field("sodium", .double, .required)
      .field("totalCarbohydrates", .double, .required)
      .field("dietaryFiber", .double, .required)
      .field("sugar", .double, .required)
      .field("protein", .double, .required)
      .field("calcium", .double, .required)
      .field("potassium", .double, .required)
      .field("vitaminA", .double, .required)
      .field("vitaminC", .double, .required)
      .field("iron", .double, .required)
      .unique(on: "identifier")
      .create().flatMap{
        guard let url = Bundle.module.url(forResource: "NutritionalItems", withExtension: "json", subdirectory: "Resources") else {
          return database.eventLoop.makeFailedFuture(ServerError.missingFile("NutritionalItems"))
        }
        
        let decoder = JSONDecoder()
        let facts : [NutritionFact]
        do {
          let data = try Data(contentsOf: url)
          facts = [NutritionFact](try decoder.decode(Dictionary<String, NutritionFact>.self, from: data).values)
        } catch {
          return database.eventLoop.makeFailedFuture(error)
        }
        let items = facts.map(NutritionalItem.init(fact:))
        return items.create(on: database)
      }
  }
  
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema(NutritionalItem.schema).delete()
  }  
}

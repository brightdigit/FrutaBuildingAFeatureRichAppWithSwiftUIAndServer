import Fluent
import Vapor

struct NutritionalItemMigration: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
    database.schema(NutritionalItem.schema)
      .id()
      .field("identifier", .double, .required)
      .field("localizedFoodItemName", .double, .required)
      .field("referenceMass", .double, .required)
      .field("density", .double, .required)
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
      .create()
  }
  
  func revert(on database: Database) -> EventLoopFuture<Void> {
    database.schema(NutritionalItem.schema).delete()
  }  
}

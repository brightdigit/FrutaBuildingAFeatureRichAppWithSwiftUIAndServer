//
//  File.swift
//  
//
//  Created by Leo Dion on 7/14/21.
//

import Fluent
import Vapor
import FrutaKit

final class NutritionalItem : Model {
  init() {
    
  }
  init(id: UUID? = nil, identifier: String, localizedFoodItemName: String, referenceMass: Double, densityMass: Double, densityVolume: Double, totalSaturatedFat: Double, totalMonounsaturatedFat: Double, totalPolyunsaturatedFat: Double, cholesterol: Double, sodium: Double, totalCarbohydrates: Double, dietaryFiber: Double, sugar: Double, protein: Double, calcium: Double, potassium: Double, vitaminA: Double, vitaminC: Double, iron: Double) {
    self.id = id
    self.identifier = identifier
    self.localizedFoodItemName = localizedFoodItemName
    self.referenceMass = referenceMass
    self.densityMass = densityMass
    self.densityVolume = densityVolume
    self.totalSaturatedFat = totalSaturatedFat
    self.totalMonounsaturatedFat = totalMonounsaturatedFat
    self.totalPolyunsaturatedFat = totalPolyunsaturatedFat
    self.cholesterol = cholesterol
    self.sodium = sodium
    self.totalCarbohydrates = totalCarbohydrates
    self.dietaryFiber = dietaryFiber
    self.sugar = sugar
    self.protein = protein
    self.calcium = calcium
    self.potassium = potassium
    self.vitaminA = vitaminA
    self.vitaminC = vitaminC
    self.iron = iron
  }
  
  static let schema = "Nutritional_Items"
  
  @ID()
  public var id: UUID?
  
  @Field(key: "identifier")
  public var identifier : String  
  
  @Field(key: "localizedFoodItemName")
  public var localizedFoodItemName : String
  
  @Field(key: "referenceMass")
  public var referenceMass : Double
  
  @Field(key: "densityMass")
  public var densityMass : Double
  
  @Field(key: "densityVolume")
  public var densityVolume : Double
  
  @Field(key: "totalSaturatedFat")
  public var totalSaturatedFat : Double
  
  @Field(key: "totalMonounsaturatedFat")
  public var totalMonounsaturatedFat : Double
  
  @Field(key: "totalPolyunsaturatedFat")
  public var totalPolyunsaturatedFat : Double
  
  @Field(key: "cholesterol")
  public var cholesterol : Double
  
  @Field(key: "sodium")
  public var sodium : Double
  
  @Field(key: "totalCarbohydrates")
  public var totalCarbohydrates : Double
  
  @Field(key: "dietaryFiber")
  public var dietaryFiber : Double
  
  @Field(key: "sugar")
  public var sugar : Double
  
  @Field(key: "protein")
  public var protein : Double
  
  @Field(key: "calcium")
  public var calcium : Double
  
  @Field(key: "potassium")
  public var potassium : Double
  
  @Field(key: "vitaminA")
  public var vitaminA : Double
  
  @Field(key: "vitaminC")
  public var vitaminC : Double
  
  @Field(key: "iron")
  public var iron : Double
}

extension NutritionalItem {
  convenience init(fact: NutritionFact) {
    self.init(id: nil, identifier: fact.identifier, localizedFoodItemName: fact.localizedFoodItemName, referenceMass: fact.referenceMass.value, densityMass: fact.density.mass.value, densityVolume: fact.density.volume.value, totalSaturatedFat: fact.totalSaturatedFat.value, totalMonounsaturatedFat: fact.totalMonounsaturatedFat.value, totalPolyunsaturatedFat: fact.totalPolyunsaturatedFat.value, cholesterol: fact.cholesterol.value, sodium: fact.sodium.value, totalCarbohydrates: fact.totalCarbohydrates.value, dietaryFiber: fact.dietaryFiber.value, sugar: fact.sugar.value, protein: fact.protein.value, calcium: fact.calcium.value, potassium: fact.potassium.value, vitaminA: fact.vitaminA.value, vitaminC: fact.vitaminC.value, iron: fact.iron.value)
  }
}

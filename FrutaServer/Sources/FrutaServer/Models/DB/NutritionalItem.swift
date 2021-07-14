//
//  File.swift
//  
//
//  Created by Leo Dion on 7/14/21.
//

import Fluent
import Vapor

final class NutritionalItem: Model {
  static let schema = "Nutritional_Items"
  
  public init() {}
  
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

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Definition of how the ingredients should appear in their thumbnail and card appearances.
*/

#if !canImport(CoreGraphics)
struct CGSize {
  let width: Double
  let height: Double
  static let zero = Self.init(width: 0, height: 0)
}
#endif

#if canImport(SwiftUI)
import SwiftUI
#endif

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if canImport(SwiftUI)
extension Angle {
  static func value(fromDegrees value: Double) -> Double {
    Self.degrees(value).degrees
  }
}
extension BlendMode {
  func intValue () -> Int? {
    switch self {
    case .overlay:
      return 1
    case .plusLighter:
      return 2
    case .plusDarker:
      return 3
    case .softLight:
      return 4
    default:
      return nil
    }
  }
}
#else
enum Angle {
  static func value(fromDegrees value: Double) -> Double {
    value / 180.0 * Double.pi
  }
}
enum BlendMode : Int, Codable {
  case overlay
  case plusLighter
  case plusDarker
  case softLight
  
  func intValue () -> Int? {
    return self.rawValue
  }
}
extension String {
  init(localized: String, table: String, comment: String) {
    self.init(localized)
  }
}
typealias AttributedString = String
#endif

#if canImport(SwiftUI)
// MARK: - SwiftUI
@available(macOS 11, *)
extension Color {
  func hexValue() -> Int? {
    guard let values = self.cgColor?.components else {
      return nil
    }
         var outputR: Int = 0
         var outputG: Int = 0
         var outputB: Int = 0
         var outputA: Int = 1

         switch values.count {
             case 1:
                 outputR = Int(values[0] * 255)
                 outputG = Int(values[0] * 255)
                 outputB = Int(values[0] * 255)
                 outputA = 1
             case 2:
                 outputR = Int(values[0] * 255)
                 outputG = Int(values[0] * 255)
                 outputB = Int(values[0] * 255)
                 outputA = Int(values[1] * 255)
             case 3:
                 outputR = Int(values[0] * 255)
                 outputG = Int(values[1] * 255)
                 outputB = Int(values[2] * 255)
                 outputA = 1
             case 4:
                 outputR = Int(values[0] * 255)
                 outputG = Int(values[1] * 255)
                 outputB = Int(values[2] * 255)
                 outputA = Int(values[3] * 255)
             default:
                 break
         }
    
    return (outputA << 24) | (outputR << 16) | (outputG << 8) | outputB
     }
  
     init(argb: Int) {
       self.init(.sRGB,
                 red: Double((argb >> 16) & 0xFF) / 255.0,
                 green: Double((argb >> 8) & 0xFF) / 255.0,
                 blue:  Double(argb & 0xFF) / 255.0,
                 opacity:  Double((argb >> 24) & 0xFF) / 255.0)
    }
}

#endif


@available(macOS 12.0, *)
extension Ingredient {
    
#if canImport(SwiftUI)
    /// Defines how the `Ingredient`'s title should be displayed in card mode
  struct CardTitle {

    
      var color = Color.black
        var rotation = Angle.degrees(0)
        var offset = CGSize.zero
        var blendMode = BlendMode.normal
        var opacity: Double = 1
        var fontSize: Double = 1
    }
  #endif
  
  struct CardTitleProperties : Codable {
    init(color: Int = 0, rotation: Double = 0, xOffset: Double = 0, yOffset: Double = 0, blendMode: Int = 1, opacity: Double = 1, fontSize: Double = 1) {
      self.color = color
      self.rotation = rotation
      self.xOffset = xOffset
      self.yOffset = yOffset
      self.blendMode = blendMode
      self.opacity = opacity
      self.fontSize = fontSize
    }
    
    public init(color: Int = 0, rotation: Double = 0, offset: CGSize = CGSize.zero, blendMode: BlendMode = .overlay, opacity: Double = 1, fontSize: Double = 1) {
        self.color = color
        self.rotation = rotation
        self.xOffset = offset.width
        self.yOffset = offset.height
      self.blendMode = blendMode.intValue() ?? 1
        self.opacity = opacity
        self.fontSize = fontSize
      }
    
    var color : Int = 0
    var rotation : Double = 0
    var xOffset: Double = 0
    var yOffset: Double = 0
    var blendMode: Int = BlendMode.overlay.intValue() ?? 1
    var opacity: Double = 1
    var fontSize: Double = 1
  }

    
    /// Defines a state for the `Ingredient` to transition from when changing between card and thumbnail
    struct Crop {
        var xOffset: Double = 0
        var yOffset: Double = 0
        var scale: Double = 1
        
        var offset: CGSize {
            CGSize(width: xOffset, height: yOffset)
        }
    }
    
  #if canImport(SwiftUI)
    /// The `Ingredient`'s image, useful for backgrounds or thumbnails
    var image: Image {
        Image("ingredient/\(id)", label: Text(name))
            .renderingMode(.original)
    }
  #endif
}

// MARK: - All Recipes

@available(iOS 15.0, macOS 12.0, *)
extension Ingredient {
    static let avocado = Ingredient(
        id: "avocado",
        name: String(localized: "Avocado", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
          color: 0xffcc6600,
            offset: CGSize(width: 0, height: 20),
            blendMode: .plusDarker,
            opacity: 0.4,
            fontSize: 60
        )
    )
    
    static let almondMilk = Ingredient(
        id: "almond-milk",
        name: String(localized: "Almond Milk", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            offset: CGSize(width: 0, height: -140),
            blendMode: .overlay,
            fontSize: 40
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let banana = Ingredient(
        id: "banana",
        name: String(localized: "Banana", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            rotation: Angle.value(fromDegrees: -30),
            offset: CGSize(width: 0, height: 0),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let blueberry = Ingredient(
        id: "blueberry",
        name: String(localized: "Blueberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xffffffff,
            offset: CGSize(width: 0, height: 100),
            opacity: 0.5,
            fontSize: 45
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 2)
    )
    
    static let carrot = Ingredient(
        id: "carrot",
        name: String(localized: "Carrot", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
          rotation: Angle.value(fromDegrees: -90),
            offset: CGSize(width: -120, height: 100),
            blendMode: .plusDarker,
            opacity: 0.3,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1.2)
    )
    
    static let chocolate = Ingredient(
        id: "chocolate",
        name: String(localized: "Chocolate", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
          color: 0xffcc6600,
            rotation: Angle.value(fromDegrees: -11),
            offset: CGSize(width: 0, height: 10),
            blendMode: .plusDarker,
            opacity: 0.8,
            fontSize: 45
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let coconut = Ingredient(
        id: "coconut",
        name: String(localized: "Coconut", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xffcc6600,
            offset: CGSize(width: 40, height: 110),
            blendMode: .plusDarker,
            opacity: 0.8,
            fontSize: 36
        ),
        thumbnailCrop: Crop(scale: 1.5)
    )
    
    static let kiwi = Ingredient(
        id: "kiwi",
        name: String(localized: "Kiwi", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            offset: CGSize(width: 0, height: 0),
            blendMode: .overlay,
            fontSize: 140
        ),
        thumbnailCrop: Crop(scale: 1.1)
    )
    
    static let lemon = Ingredient(
        id: "lemon",
        name: String(localized: "Lemon", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            rotation: Angle.value(fromDegrees: -9),
            offset: CGSize(width: 15, height: 90),
            blendMode: .overlay,
            fontSize: 80
        ),
        thumbnailCrop: Crop(scale: 1.1)
    )
    
    static let mango = Ingredient(
        id: "mango",
        name: String(localized: "Mango", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xffff9900,
            offset: CGSize(width: 0, height: 20),
            blendMode: .plusLighter,
            fontSize: 70
        )
    )
    
    static let orange = Ingredient(
        id: "orange",
        name: String(localized: "Orange", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            rotation: Angle.value(fromDegrees: -90),
            offset: CGSize(width: -130, height: -60),
            blendMode: .overlay,
            fontSize: 80
        ),
        thumbnailCrop: Crop(yOffset: -15, scale: 2)
    )
    
    static let papaya = Ingredient(
        id: "papaya",
        name: String(localized: "Papaya", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            offset: CGSize(width: -20, height: 20),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(scale: 1)
    )
    
    static let peanutButter = Ingredient(
        id: "peanut-butter",
        name: String(localized: "Peanut Butter", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            offset: CGSize(width: 0, height: 190),
            blendMode: .overlay,
            fontSize: 35
        ),
        thumbnailCrop: Crop(yOffset: -20, scale: 1.2)
    )
    
    static let pineapple = Ingredient(
        id: "pineapple",
        name: String(localized: "Pineapple", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xffffff00,
            offset: CGSize(width: 0, height: 90),
            blendMode: .plusLighter,
            opacity: 0.5,
            fontSize: 55
        )
    )
    
    static let raspberry = Ingredient(
        id: "raspberry",
        name: String(localized: "Raspberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xffffcccc,
            blendMode: .plusLighter,
            fontSize: 50
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1.5)
    )
    
    static let spinach = Ingredient(
        id: "spinach",
        name: String(localized: "Spinach", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            offset: CGSize(width: 0, height: -150),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let strawberry = Ingredient(
        id: "strawberry",
        name: String(localized: "Strawberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 1,
            offset: CGSize(width: 35, height: -5),
            blendMode: .softLight,
            opacity: 0.7,
            fontSize: 30
        ),
        thumbnailCrop: Crop(scale: 2.5),
        cardCrop: Crop(xOffset: -110, scale: 1.35)
    )

    static let water = Ingredient(
        id: "water",
        name: String(localized: "Water", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            color: 0xff0000ff,
            offset: CGSize(width: 0, height: 150),
            opacity: 0.2,
            fontSize: 50
        ),
        thumbnailCrop: Crop(yOffset: -10, scale: 1.2)
    )
    
    static let watermelon = Ingredient(
        id: "watermelon",
        name: String(localized: "Watermelon", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitleProperties(
            rotation: Angle.value(fromDegrees: -50),
            offset: CGSize(width: -80, height: -50),
            blendMode: .overlay,
            fontSize: 25
        ),
        thumbnailCrop: Crop(yOffset: -10, scale: 1.2)
    )
}

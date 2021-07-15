/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model that represents a smoothie ingredient and its appearance as a thumbnail and card.
*/

// MARK: - Ingredient
@available(iOS 15.0, macOS 12.0, *)
struct Ingredient: Identifiable, Codable {
    var id: String
    var name: String
    var title = CardTitleProperties()
    var thumbnailCrop = Crop()
    var cardCrop = Crop()

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

// MARK: - All Ingredients
@available(iOS 15.0, macOS 12.0, *)
extension Ingredient {
    static let all: [Ingredient] = [
        .avocado,
        .almondMilk,
        .banana,
        .blueberry,
        .carrot,
        .chocolate,
        .coconut,
        .kiwi,
        .lemon,
        .mango,
        .orange,
        .papaya,
        .peanutButter,
        .pineapple,
        .raspberry,
        .spinach,
        .strawberry,
        .watermelon
    ]
    
    init?(for id: Ingredient.ID) {
        guard let result = Ingredient.all.first(where: { $0.id == id }) else {
            return nil
        }
        self = result
    }
}

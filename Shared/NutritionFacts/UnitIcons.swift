/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Iconography for different units for mass and volume.
*/

import Foundation
import SwiftUI
import FrutaKit


extension UnitMass: UnitIconProvider {
    public var customUnitIcon: Image {
        Image(systemName: "scalemass.fill")
    }
}

extension UnitVolume: UnitIconProvider {
    public var customUnitIcon: Image {
        switch symbol {
        // Icons included in the asset catalog
        case "cup", "qt", "tbsp", "tsp", "gal":
            return Image(symbol)
        default:
            return Image(systemName: "drop.fill")
        }
    }
}

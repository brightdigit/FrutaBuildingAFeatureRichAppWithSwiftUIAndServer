/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A measurement that can be displayed with a title and image.
*/

import Foundation

#if canImport(SwiftUI)
import SwiftUI
#endif

public protocol DisplayableMeasurement {
#if canImport(SwiftUI)
    var unitImage: Image { get }
    func localizedSummary(unitStyle: MeasurementFormatter.UnitStyle, unitOptions: MeasurementFormatter.UnitOptions) -> String
#endif
}

#if canImport(SwiftUI)
extension DisplayableMeasurement {
    public func localizedSummary() -> String {
        localizedSummary(unitStyle: .long, unitOptions: [.providedUnit])
    }
}
#endif


#if canImport(SwiftUI)

@available(macOS 11.0, *)
extension Measurement: DisplayableMeasurement {
    public func localizedSummary(unitStyle: MeasurementFormatter.UnitStyle = .long,
                                 unitOptions: MeasurementFormatter.UnitOptions = [.providedUnit]) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = unitStyle
        formatter.unitOptions = unitOptions
        return formatter.string(from: self)
    }
    public var unitImage: Image {
        unit.unitIcon
    }
}
#endif

#if canImport(SwiftUI)


// Allow Unit subclasses to provide icon overrides
public protocol UnitIconProvider {
    var customUnitIcon: Image { get }
}
@available(macOS 11.0, *)
extension Unit {
    public var unitIcon: Image {
        if let iconProvider = self as? UnitIconProvider {
            return iconProvider.customUnitIcon
        }
        // Fallback to 'gauge' where no icon is specified
        return Image(systemName: "gauge")
    }
}

#endif

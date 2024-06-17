/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 The flavor-profile model.
 */

import SwiftUI

struct FlavorProfile: Hashable, Codable {
    var salty: Int
    var sweet: Int
    var bitter: Int
    var sour: Int
    var savory: Int
    var spicy: Int
    
    init(salty: Int = 0, sweet: Int = 0, bitter: Int = 0, sour: Int = 0, savory: Int = 0, spicy: Int = 0) {
        self.salty = salty
        self.sweet = sweet
        self.bitter = bitter
        self.sour = sour
        self.savory = savory
        self.spicy = spicy
    }
    
    subscript(flavor: Flavor) -> Int {
        get {
            switch flavor {
                case .salty: return salty
                case .sweet: return sweet
                case .bitter: return bitter
                case .sour: return sour
                case .savory: return savory
                case .spicy: return spicy
            }
        }
        set(newValue) {
            switch flavor {
                case .salty: salty = newValue
                case .sweet: sweet = newValue
                case .bitter: bitter = newValue
                case .sour: sour = newValue
                case .savory: savory = newValue
                case .spicy: spicy = newValue
            }
        }
    }
    
    func union(with other: FlavorProfile) -> FlavorProfile {
        var result = self
        for flavor in Flavor.allCases {
            result[flavor] += other[flavor]
        }
        return result
    }
    
    mutating func formUnion(with other: FlavorProfile) {
        self = union(with: other)
    }
    
    var mostPotent: (Flavor, Int) {
        var highestValue = 0
        var mostPotent = Flavor.sweet
        for flavor in Flavor.allCases {
            let value = self[flavor]
            if value > highestValue {
                highestValue = value
                mostPotent = flavor
            }
        }
        return (mostPotent, highestValue)
    }
    
    var mostPotentFlavor: Flavor {
        mostPotent.0
    }
    
    var mostPotentValue: Int {
        mostPotent.1
    }
}

enum Flavor: String, Identifiable, CaseIterable {
    case salty, sweet, bitter, sour, savory, spicy
    
    var id: String { rawValue }
    var name: String {
        switch self {
            case .salty:
                return String(localized: "Salty", comment: "The main flavor-profile of a donut.")
            case .sweet:
                return String(localized: "Sweet", comment: "The main flavor-profile of a donut.")
            case .bitter:
                return String(localized: "Bitter", comment: "The main flavor-profile of a donut.")
            case .sour:
                return String(localized: "Sour", comment: "The main flavor-profile of a donut.")
            case .savory:
                return String(localized: "Savory", comment: "The main flavor-profile of a donut.")
            case .spicy:
                return String(localized: "Spicy", comment: "The main flavor-profile of a donut.")
        }
    }
    
    var image: Image {
        Image.flavorSymbol(self)
    }
}

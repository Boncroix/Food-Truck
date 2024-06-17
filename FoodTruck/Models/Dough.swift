/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
An extension to donut to represent the dough.
*/

import SwiftUI

extension Donut {
    struct Dough: Ingredient {
        var name: String
        var imageAssetName: String
        var flavors: FlavorProfile
        
        var backgroundColor: Color {
            Color("\(Self.imageAssetPrefix)/\(imageAssetName)-bg")
        }
        static let imageAssetPrefix = "dough"
    }
}

extension Donut.Dough {
    static let blueberry = Donut.Dough(
        name: String(localized: "Blueberry Dough", comment: "Blueberry-flavored dough."),
        imageAssetName: "blue",
        flavors: FlavorProfile(salty: 1, sweet: 2, savory: 2)
    )

    static let chocolate = Donut.Dough(
        name: String(localized: "Chocolate Dough", comment: "Chocolate-flavored dough."),
        imageAssetName: "brown",
        flavors: FlavorProfile(salty: 1, sweet: 3, bitter: 1, sour: -1, savory: 1)
    )
    
    static let sourCandy = Donut.Dough(
        name: String(localized: "Sour Candy", comment: "Sour-candy-flavored dough."),
        imageAssetName: "green",
        flavors: FlavorProfile(salty: 1, sweet: 2, sour: 3, savory: -1)
    )

    static let strawberry = Donut.Dough(
        name: String(localized: "Strawberry Dough", comment: "Strawberry-flavored dough."),
        imageAssetName: "pink",
        flavors: FlavorProfile(sweet: 3, savory: 2)
    )

    static let plain = Donut.Dough(
        name: String(localized: "Plain", comment: "Plain donut dough."),
        imageAssetName: "plain",
        flavors: FlavorProfile(salty: 1, sweet: 1, bitter: 1, savory: 2)
    )

    static let powdered = Donut.Dough(
        name: String(localized: "Powdered Dough", comment: "Powdered donut dough."),
        imageAssetName: "white",
        flavors: FlavorProfile(salty: -1, sweet: 4, savory: 1)
    )

    static let lemonade = Donut.Dough(
        name: String(localized: "Lemonade", comment: "Lemonade-flavored dough."),
        imageAssetName: "yellow",
        flavors: FlavorProfile(salty: 1, sweet: 1, sour: 3)
    )
    
    static let all = [blueberry, chocolate, sourCandy, strawberry, plain, powdered, lemonade]
}

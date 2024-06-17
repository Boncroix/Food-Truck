//
//  Image+FlavorSymbol.swift
//  FoodTruck
//
//  Created by Adrián Silva on 15/6/24.
//

import SwiftUI

extension Image {
    static var donutSymbol: Image {
        Image("donut")
    }
    
    static func flavorSymbol(_ flavor: Flavor) -> Image {
        switch flavor {
        case .salty:
            return Image("salty")
        case .sweet:
            return Image("sweet")
        case .bitter:
            return Image("bitter")
        case .sour:
            return Image("sour")
        case .savory:
            return Image(systemName: "face.smiling")
        case .spicy:
            return Image("spicy")
        }
    }
}

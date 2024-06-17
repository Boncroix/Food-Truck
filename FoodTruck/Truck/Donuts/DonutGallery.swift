//
//  DonutGallery.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI

struct DonutGallery: View {
    @Bindable var model: FoodTruckModel
    
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                DonutGalleryGrid(
                    model: model,
                    width: proxy.size.width
                )
            }
        }
        .background()
        .toolbarRole(.browser)
        .searchable(text: $model.searchText)
        .navigationTitle("Donuts")
        .analyticsScreen(name: "donut_Gallery")
    }
}

#Preview {
    DonutGallery(model: FoodTruckModel())
}

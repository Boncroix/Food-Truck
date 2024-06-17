//
//  DonutGalleryGrid.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI

struct DonutGalleryGrid: View {
    @Bindable var model: FoodTruckModel
    var width: Double
    
    private let thumbnailSize: Double = 100
    private let gridItems = [
        GridItem(
            .adaptive(minimum: 150),
            spacing: 20,
            alignment: .top
        )
    ]
    
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(Array(model.filteredDonuts)) { donut in
                ZStack {
                    VStack {
                        DonutsView(donut: donut)
                            .frame(width: thumbnailSize, height: thumbnailSize)
                        
                        VStack {
                            let flavor = donut.flavors.mostPotentFlavor
                            Text(donut.name)
                            HStack(spacing: 4) {
                                flavor.image
                                Text(flavor.name)
                            }
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        }
                        .multilineTextAlignment(.center)
                    }
                    
                     VStack {
                         HStack {
                             Spacer()
                             
                             Button(action: {
                                 model
                                     .toggleFavourite(donut: donut)
                             }, label: {
                                 Image(
                                    systemName: model.isFavourite(donut: donut)
                                        ? "heart.fill"
                                        : "heart"
                                 )
                             })
                         }
                     }
                    
                    Spacer()
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    GeometryReader { proxy in
        DonutGalleryGrid(model: FoodTruckModel(), width: proxy.size.width)
    }
}

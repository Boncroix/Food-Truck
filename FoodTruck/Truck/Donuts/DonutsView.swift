//
//  DonutsView.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI

struct DonutsView: View {
    
    var donut: Donut
    var visibleLayers: DonutLayer = .all
    
    init(donut: Donut,
         visibleLayers: DonutLayer = .all) {
        self.donut = donut
        self.visibleLayers = visibleLayers
    }
    
    var body: some View {
        GeometryReader { proxy in
            // Calculamos el mínimo entre el ancho y el alto
            // si el mínimo es menor o igual a 128 usamos thumbnail
            // No usaremos thumbnail si es mayor que 128
            let useThumbnail = min(
                proxy.size.width,
                proxy.size.height
            ) <= 128
            
            ZStack {
                if visibleLayers.contains(.dough) {
                    donut.dough.image(thumbnail: useThumbnail)
                        .resizable()
                        .interpolation(.medium)
                        .scaledToFit()
                        .id(donut.dough.id)
                }
                
                if visibleLayers.contains(.glaze) {
                    let glaze = donut.glaze  {
                        glaze.image(thumbnail: useThumbnail)
                            .resizable()
                            .interpolation(.medium)
                            .scaledToFit()
                            .id(glaze.id)
                    }
                }
                
                if visibleLayers.contains(.topping) {
                    let topping = donut.topping  {
                        topping.image(thumbnail: useThumbnail)
                            .resizable()
                            .interpolation(.medium)
                            .scaledToFit()
                            .id(topping.id)
                    }
                }
                
            }
            .aspectRatio(1, contentMode: .fit)
            // Applicar los efectos a la vista padre antes que
            // a la vista hijo
            .compositingGroup()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

#Preview {
    DonutsView(donut: .classic)
}

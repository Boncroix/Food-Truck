//
//  TrackDonutsCard.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI

struct TrackDonutsCard: View {
    var donuts: [Donut]
    var groupText: String
    
    var body: some View {
        VStack {
            GroupBox(
                label: Label {
                    Text(groupText)
                } icon: {
                    Image.donutSymbol
                }
                    .foregroundStyle(Color.accentColor)
            ) {
                DonutLatticeLayout {
                    ForEach(donuts.prefix(14)) { donut in
                        DonutsView(donut: donut)
                    }
                }
                .frame(minHeight: 60, maxHeight: .infinity)
            }
        }
        .padding(10)
        .background()
    }
}

#Preview {
    TrackDonutsCard(
        donuts: Donut.all,
        groupText: "Donut"
    )
}

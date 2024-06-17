//
//  ContentView.swift
//  FoodTruck
//
//  Created by Adrián Silva on 15/6/24.
//

import SwiftUI

enum Navigation: Hashable {
    case donuts
}

struct ContentView: View {
    // MARK: - Model
    @State var model = FoodTruckModel()
    @State private var navigation: [Navigation] = []
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $navigation) {
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    TruckHeader()
                    
                    Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                        TrackDonutsCard(
                            donuts: Array(model.donuts.values),
                            groupText: "Donuts"
                        )
                        .onTapGesture {
                            navigation.append(.donuts)
                        }
                        
                        if !model.favouriteDonuts.isEmpty {
                            TrackDonutsCard(
                                donuts: Array(model.favouriteDonuts.values),
                                groupText: "Favourites")
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.horizontal, .bottom], 16)
                    .frame(maxWidth: 1200)
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        model.settingsButtonTapped()
                    }, label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .bold()
                    })
                    .frame(width: 44, height: 44)
                    .padding(.trailing)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Navigation.self) { navigation in
                switch navigation {
                    case .donuts:
                        DonutGallery(model: model)
                }
            }
            .sheet(isPresented: $model.isSettingsPresented) {
                SettingsView(model: model)
            }
        }
    }
}

#Preview {
    ContentView()
}

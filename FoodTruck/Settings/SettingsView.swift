//
//  SerringsView.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var model: FoodTruckModel
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack(spacing: 12) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color.accentColor)
                        
                        VStack(alignment: .leading) {
                            Text("José Bueno")
                                .font(.headline)
                            Text("boncroix@gmail.com")
                                .font(.subheadline)
                        }
                    }
                } header: {
                    Text("User Profile")
                }
                
                Section {
                    HStack(spacing: 12) {
                        Image(systemName: "creditcard.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color.accentColor)
                        
                        Toggle(
                            isOn: $model.isPremiumUser) {
                                VStack(alignment: .leading) {
                                    Text("Suscription status")
                                        .font(.headline)
                                    Text("Premium")
                                        .font(.subheadline)
                                }
                            }
                            .tint(Color.accentColor)
                    }
                } header: {
                    Text("Subscription")
                }
                
                Section {
                    HStack(spacing: 12) {
                        Image(systemName: "person.badge.key")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color.accentColor)
                        
                        VStack(alignment: .leading) {
                            Text("User ID")
                                .font(.headline)
                            Text(model.userID)
                                .font(.subheadline)
                        }
                    }
                } header: {
                    Text("User Properties")
                }
                
                HStack {
                    Text("App Version")
                        .font(.headline)
                    Spacer()
                    Text(model.appVersionnumber)
                }
            }
        }
        .analyticsScreen(name: "settings_view")
    }
}

#Preview {
    SettingsView(model: FoodTruckModel())
}

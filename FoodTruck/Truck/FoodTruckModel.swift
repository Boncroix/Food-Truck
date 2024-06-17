//
//  FoodTruckModel.swift
//  FoodTruck
//
//  Created by Jose Bueno Cruz on 17/6/24.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseAnalyticsSwift

@Observable
final class FoodTruckModel {

    var donuts: [Int: Donut]
    var favouriteDonuts: [Int: Donut] = [:]
    var isPremiumUser = false
    let userID = "my_user_id"
    var isSettingsPresented = false
    var searchText = ""
    var filteredDonuts: [Donut] {
        Array(
            donuts
                .filter { $0.value.matches(searchText: searchText)}
                .values
        )
        .sorted(by: { $0.id < $1.id })
    }
    
    
    var appVersionnumber: String {
        Bundle.main
            .infoDictionary?["CFBundleShortVersionString"] as? String ?? "canary_wolf"
    }
    
    init(donuts: [Donut] = Donut.all,
                  favouriteDonuts: [Int : Donut] = [:]
    ) {
        self.donuts = Dictionary(
            uniqueKeysWithValues: donuts.map { ($0.id, $0)}
        )
        self.favouriteDonuts = favouriteDonuts
        configureFirebase()
    }
    
    func isFavourite(donut: Donut) -> Bool {
        if let _ = favouriteDonuts[donut.id] {
            return true
        }
        return false
    }
    
    func toggleFavourite(donut: Donut) {
        Analytics.logEvent("donut_toggle_favorite", 
                           parameters: [
                                "donut_id" : donut.id,
                                "donut_name" : donut.name,
                                "is_favorite" : (!isFavourite(donut: donut)).description
            ]
        )
        if isFavourite(donut: donut) {
            favouriteDonuts.removeValue(forKey: donut.id)
            return
        }
        favouriteDonuts[donut.id] = donut
    }
    
    func settingsButtonTapped() {
        isSettingsPresented = true
    }
    
    func donutsCardTapped() {
        Analytics.logEvent(
            "donut-card-tapped",
            parameters: [
                "favourite_donuts-count": favouriteDonuts.values.count,
                "donuts_count": donuts.values.count
            
            ]
        )
    }
    
    func handlePremiumAnalytics() {
        Analytics.logEvent(
            "premium_toggle",
            parameters: [
                "toogle_value": isPremiumUser.toggle(),
            ]
        )
        Analytics.setUserProperty(isPremiumUser.description, forName: "is_premium")
    }
    
    func configureFirebase() {
        Analytics.setUserID(userID)
    }
}

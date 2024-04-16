//
//  iStoreApp.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

@main
struct iStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ViewManager(navigationCoordinator: NavigationCoordinator(), authenticationViewModel: AuthenticationViewModel(authenticationManager: AuthenticationManager(), user: AuthenticatedUser(id: Int(), username: String(),firstName: String(), lastName: String(), maidenName: String(), email: String(), phone: String(), image: URL(fileURLWithPath: String()), address: HomeAddress(address: String(), city: String(), postalCode: String(), coordinates: Coordinates(lat: Double(), lng: Double()), state: String()))), locationDataManager: LocationDataManager(address: String(), postalCode: String(), city: String(), state: String(), latitude: Double(), longitude: Double()))
        }
    }
}

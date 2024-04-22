//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 10.02.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var locationDataManager: LocationDataManager
    
    private let user: AuthenticatedUser
    private let isGuest: Bool
    
    init(user: AuthenticatedUser, isGuest: Bool) {
        self.user = user
        self.isGuest = isGuest
    }
    
    var body: some View {
        TabView {
            HomeView(id: user.id, homeAddress: user.address.address, homePostalCode: user.address.postalCode, homeCity: user.address.city, homeState: user.address.state, homeLatitude: user.address.coordinates.lat, homeLongitude: user.address.coordinates.lng, currentAddress: locationDataManager.address, currentPostalCode: locationDataManager.postalCode, currentCity: locationDataManager.city, currentState: locationDataManager.state, currentLatitude: locationDataManager.latitude, currentLongitude: locationDataManager.longitude, isCurrentLocation: locationDataManager.isCurrentLocation, isGuest: isGuest, getLocationPermission: locationDataManager.requestUserLocationPermission)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            CartView(id: user.id)
                .tabItem {
                    Image(systemName: "cart")
                }
            
            ProfileView(username: user.username, firstName: user.firstName, lastName: user.lastName, maidenName: user.maidenName, email: user.email, phone: user.phone, image: user.image, homeAddress: user.address.address, homePostalCode: user.address.postalCode, homeCity: user.address.city, homeState: user.address.state, isGuest: isGuest)
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .tint(.pink)
    }
}

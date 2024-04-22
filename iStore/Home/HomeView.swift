//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeViewModel = HomeViewModel(networkManager: NetworkManager())
    
    private let id: Int
    private let homeAddress: String
    private let homePostalCode: String
    private let homeCity: String
    private let homeState: String
    private let homeLatitude: Double
    private let homeLongitude: Double
    
    private let currentAddress: String
    private let currentPostalCode: String
    private let currentCity: String
    private let currentState: String
    private let currentLatitude: Double
    private let currentLongitude: Double
    
    private let isCurrentLocation: Bool
    private let isGuest: Bool
    private let getLocationPermission: () -> Void
    
    init(id: Int, homeAddress: String, homePostalCode: String, homeCity: String, homeState: String, homeLatitude: Double, homeLongitude: Double, currentAddress: String, currentPostalCode: String, currentCity: String, currentState: String, currentLatitude: Double, currentLongitude: Double, isCurrentLocation: Bool, isGuest: Bool, getLocationPermission: @escaping () -> Void) {
        self.id = id
        self.homeAddress = homeAddress
        self.homePostalCode = homePostalCode
        self.homeCity = homeCity
        self.homeState = homeState
        self.homeLatitude = homeLatitude
        self.homeLongitude = homeLongitude
        self.currentAddress = currentAddress
        self.currentPostalCode = currentPostalCode
        self.currentCity = currentCity
        self.currentState = currentState
        self.currentLatitude = currentLatitude
        self.currentLongitude = currentLongitude
        self.isCurrentLocation = isCurrentLocation
        self.isGuest = isGuest
        self.getLocationPermission = getLocationPermission
    }
    
    var body: some View {
        NavigationStack {
            VStack() {
                if isGuest || isCurrentLocation {
                    UserAddressButton(address: currentAddress, postalCode: currentPostalCode, city: currentCity, state: currentState, latitude: currentLatitude, longitude: currentLongitude)
                } else {
                    UserAddressButton(address: homeAddress, postalCode: homePostalCode, city: homeCity, state: homeState, latitude: homeLatitude, longitude: homeLongitude)
                }
                
                if homeViewModel.isloading {
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                } else {
                    ProductsGrid(products: homeViewModel.products, userID: id)
                }
            }
            .padding(.horizontal)
            .navigationTitle(iStore)
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $homeViewModel.searchText)
        .onChange(of: homeViewModel.searchProduct) {
            homeViewModel.products.removeAll()
            
            homeViewModel.showProducts { data in
                DispatchQueue.main.async {
                    homeViewModel.products.append(contentsOf: data.products)
                    homeViewModel.isloading = false
                }
            }
        }
        .onAppear() {
            getLocationPermission()
        }
        .task {
            homeViewModel.showProducts { data in
                DispatchQueue.main.async {
                    homeViewModel.products.append(contentsOf: data.products)
                    homeViewModel.isloading = false
                }
            }
        }
    }
}

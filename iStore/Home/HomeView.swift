//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel(networkManager: NetworkManager())
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject var locationDataManager: LocationDataManager
    
    @State private var isloading = true
    
    var body: some View {
        NavigationStack {
            VStack() {
                if authenticationViewModel.isGuest || locationDataManager.isCurrentLocation {
                    UserAddressButton(address: locationDataManager.address, postalCode: locationDataManager.postalCode, city: locationDataManager.city, state: locationDataManager.state, latitude: locationDataManager.latitude, longitude: locationDataManager.longitude)
                } else {
                    UserAddressButton(address: authenticationViewModel.user.address.address, postalCode: authenticationViewModel.user.address.postalCode, city: authenticationViewModel.user.address.city, state: authenticationViewModel.user.address.state, latitude: authenticationViewModel.user.address.coordinates.lat, longitude: authenticationViewModel.user.address.coordinates.lng)
                }
                
                if isloading {
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                } else {
                    ProductsGrid(products: homeViewModel.products, userID: authenticationViewModel.user.id)
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
                    isloading = false
                }
            }
        }
        .onAppear() {
            locationDataManager.requestUserLocationPermission()
        }
        .task {
            homeViewModel.showProducts { data in
                DispatchQueue.main.async {
                    homeViewModel.products.append(contentsOf: data.products)
                    isloading = false
                }
            }
        }
    }
}

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
    
    @State private var isloading = true
    
    var body: some View {
        NavigationView {
            VStack() {
                LocationButton(address: authenticationViewModel.user.address.address, postalCode: authenticationViewModel.user.address.postalCode, city: authenticationViewModel.user.address.city, state: authenticationViewModel.user.address.state)
                
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
        .onChange(of: homeViewModel.searchProduct) { newValue in
            homeViewModel.products.removeAll()
            
            homeViewModel.showProducts { data in
                DispatchQueue.main.async {
                    homeViewModel.products.append(contentsOf: data.products)
                    isloading = false
                }
            }
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

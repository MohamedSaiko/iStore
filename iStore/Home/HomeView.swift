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
    
    @State private var text = ""
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
            .searchable(text: $text)
            .padding(.horizontal)
            .navigationTitle(iStore)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            homeViewModel.getProducts() { data in
                DispatchQueue.main.async {
                    homeViewModel.products.append(contentsOf: data.products)
                    isloading = false
                }
            }
        }
    }
}

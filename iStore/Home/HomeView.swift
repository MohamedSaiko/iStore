//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel(networkManager: NetworkManager())
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                LocationButton()
                if homeViewModel.isloading {
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                } else {
                    ProductsGrid(products: homeViewModel.products)
                }
            }
            .searchable(text: $text)
            .padding(.horizontal)
            .navigationTitle(iStore)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            homeViewModel.getProducts()
        }
    }
}

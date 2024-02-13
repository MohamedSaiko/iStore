//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeViewModel = HomeViewModel(networkManager: NetworkManager())
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            VStack() {
                LocationButton()
                
                ProductsGrid(products: homeViewModel.products)
            }
            .searchable(text: $text)
            .padding(.horizontal)
            .navigationTitle("iStore")
        }
        .task {
            homeViewModel.getProducts {
                print(homeViewModel.products)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
        }
    }
}

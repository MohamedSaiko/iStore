//
//  Category.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.02.24.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var categoryViewModel = CategoriesViewModel(networkManager: NetworkManager())
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if categoryViewModel.isloading {
                    ProgressView()
                } else {
                    ProductsGrid(products: categoryViewModel.products, userID: loginViewModel.currentUser.id)
                }
            }
            .navigationTitle(categories)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            categoryViewModel.getProducts()
        }
    }
}

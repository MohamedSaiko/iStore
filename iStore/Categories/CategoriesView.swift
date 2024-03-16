//
//  Category.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.02.24.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var categoryViewModel = CategoriesViewModel(networkManager: NetworkManager())
    
    private let userID: Int
    
    init(userID: Int) {
        self.userID = userID
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if categoryViewModel.isloading {
                    ProgressView()
                } else {
                    ProductsGrid(products: categoryViewModel.products, userID: userID)
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

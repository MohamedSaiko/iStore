//
//  Category.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.02.24.
//

import SwiftUI

struct Category: View {
    
    @StateObject var categoryViewModel = CategoryViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationView {
            ProductsGrid(products: categoryViewModel.products)
                .navigationTitle("Category")
                .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            categoryViewModel.getProducts {
                print(categoryViewModel.products)
            }
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}

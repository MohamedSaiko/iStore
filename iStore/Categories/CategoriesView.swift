//
//  Category.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.02.24.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var categoryViewModel = CategoriesViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationView {
            VStack {
                if categoryViewModel.isloading {
                    ProgressView()
                } else {
                    ProductsGrid(products: categoryViewModel.products)
                }
            }
            .navigationTitle(categories)
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
        CategoriesView()
    }
}

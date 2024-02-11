//
//  Category.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.02.24.
//

import SwiftUI

struct Category: View {
    var body: some View {
        NavigationView {
            ProductsGrid()
                .navigationTitle("Category")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}

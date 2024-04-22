//
//  ProductDetailsTabView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsTabView: View {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        TabView {
            ForEach(product.images, id:\.self) { url in
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                        .tint(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .padding(5)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
    }
}

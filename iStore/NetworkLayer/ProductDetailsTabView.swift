//
//  ProductDetailsTabView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsTabView: View {
    
    var product: Product?
    
    var body: some View {
        
        if let product = product {
//            TabView {
                //ForEach(product.images, id:\.self) { url in
            let url = product.images[0]
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    .padding(5)
                //}
//            }
//            .tabViewStyle(.page)
//            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}

struct ProductDetailsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsTabView()
    }
}

//
//  CartList.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.03.24.
//

import SwiftUI

struct CartList: View {
    
    private let carts: [CartData]
    
    init(carts: [CartData]) {
        self.carts = carts
    }
    
    var body: some View {
        List(carts) { cart in
            Section {
                ForEach(cart.products) { product in
                    HStack(alignment: .center) {
                        AsyncImage(url: product.thumbnail) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100, maxHeight: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.title)
                                .fontWeight(.bold)
                            Text("Price: $\(product.price)")
                            Text("Quantity: \(product.quantity)")
                            Text("Total Price: $\(product.total)")
                        }
                        .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.vertical, 5)
                }
            }
            .listSectionSeparator(.hidden, edges: .top)
        }
    }
}

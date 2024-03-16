//
//  ProductsGrid.swift
//  iStore
//
//  Created by Mohamed Sayed on 09.02.24.
//

import SwiftUI

struct ProductsGrid: View {
    
    private let products: [Product]
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150, maximum: 180))]
    
    private let userID: Int
    
    init(products: [Product], userID: Int) {
        self.products = products
        self.userID = userID
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: adaptiveColumn) {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailsView(productID: product.id, userID: userID)
                    } label: {
                        VStack(alignment: .center) {
                            Spacer()
                            
                            AsyncImage(url: product.thumbnail) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black, radius: 10)
                            .padding()
                            
                            Spacer()
                            
                            Text("\(product.title)")
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .font(.system(.headline, design: .rounded))
                                .padding(.horizontal, 5)
                            
                            Text("$\(product.price)")
                                .foregroundColor(.pink)
                                .font(.system(.subheadline, design: .rounded))
                        }
                        .frame(width: 170, height: 170, alignment: .center)
                        .padding(5)
                    }
                }
            }
        }
    }
}

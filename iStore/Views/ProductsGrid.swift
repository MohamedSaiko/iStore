//
//  ProductsGrid.swift
//  iStore
//
//  Created by Mohamed Sayed on 09.02.24.
//

import SwiftUI

struct ProductsGrid: View {
    
    var products: [product]
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150, maximum: 180))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: adaptiveColumn) {
                ForEach(products) { product in
                    NavigationLink {
                        Text("hello world")
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
                            .shadow(radius: 10)
                            .padding()
                            
                            Spacer()
                            
                            Text("\(product.title)")
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .font(.system(.headline, design: .rounded))
                                .padding(.horizontal, 5)
                                .padding(.bottom)
                        }
                        .frame(width: 170, height: 170, alignment: .center)
                        .padding(5)
                    }
                }
            }
        }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid(products: [])
    }
}

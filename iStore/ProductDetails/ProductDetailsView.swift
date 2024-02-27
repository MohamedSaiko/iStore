//
//  ProductDetailsView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var productDetailsViewModel = ProductDetailsViewModel(
        networkManager: NetworkManager(),
        cartManager: CartManager(),
        product: Product(id: Int(),
                         title: String(),
                         description: String(),
                         price: Int(),
                         discountPercentage: Double(),
                         rating: Double(),
                         stock: Int(),
                         brand: String(),
                         category: String(),
                         thumbnail: URL(fileURLWithPath: String()),
                         images: [URL]()))
    
    @State private var isFavoriteTapped = false
    var id: Int
    
    var body: some View {
        Group {
            if productDetailsViewModel.isloading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black)
                    .tint(.white)
                    .ignoresSafeArea()
            } else {
                VStack() {
                    ProductDetailsTabView(product: productDetailsViewModel.product)
                        .frame(height: UIScreen.main.bounds.height / 3)
                        .shadow(color: .white, radius: 10)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            
                            BrandView(product: productDetailsViewModel.product)
                            
                            Spacer()
                            
                            DescriptionView(product: productDetailsViewModel.product)
                            
                            Spacer()
                            Spacer()
                            
                            TotalPriceView(product: productDetailsViewModel.product)
                        }
                        .frame(height: UIScreen.main.bounds.height / 4)
                        .padding()
                        
                        AddToCardButton(action: productDetailsViewModel.addToCart)
                            .frame(maxWidth: .infinity)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .ignoresSafeArea()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
            }
        }
        .toolbar() {
            Button {
                print("favorite tapped")
                isFavoriteTapped.toggle()
            } label: {
                Image(systemName: isFavoriteTapped ? "heart.fill" : "heart")
            }
        }
        .task {
            productDetailsViewModel.getProduct(with: id)
        }
    }
}

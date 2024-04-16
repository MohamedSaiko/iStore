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
        cartManager: CartNetworkManager(),
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
    
    private let productID: Int
    private let userID: Int
    
    @State private var isFavoriteTapped = false
    
    init(productID: Int, userID: Int) {
        self.productID = productID
        self.userID = userID
    }
    
    var body: some View {
        VStack {
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
                        
                        AddToCardButton() {
                            productDetailsViewModel.addToCart(WithUserID: userID, productID: productID)
                        }
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
            productDetailsViewModel.getProduct(with: productID) { result in
                switch result {
                case .success(let product):
                    DispatchQueue.main.async {
                        productDetailsViewModel.product = product
                        productDetailsViewModel.isloading = false
                    }
                case .failure(let error):
                    print(NetworkError.unknownError(error))
                }
            }
        }
    }
}

//
//  ProductDetailsView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var productDetailsViewModel = ProductDetailsViewModel(networkManager: NetworkManager())
    
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
                            HStack(alignment: .center, spacing: 2) {
                                Text(productDetailsViewModel.getProductBrand())
                                    .foregroundColor(.black)
                                    .font(.system(.title2, design: .rounded))
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.pink)
                                
                                Text("\(productDetailsViewModel.getProductRating(), specifier: "%.2f")")
                                    .foregroundColor(.black)
                                    .font(.system(.title2, design: .rounded))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Desription: ")
                                    .foregroundColor(.gray)
                                    .font(.system(.headline, design: .rounded))
                                
                                Text(productDetailsViewModel.getProductDescription())
                                    .foregroundColor(.black)
                                    .font(.system(.headline, design: .rounded))
                            }
                            
                            Spacer()
                            Spacer()
                            
                            HStack() {
                                Text("Total")
                                    .foregroundColor(.black)
                                    .font(.system(.title2, design: .rounded))
                                
                                Spacer()
                                
                                Text("$\(productDetailsViewModel.getProductPrice())")
                                    .foregroundColor(.pink)
                                    .font(.system(.title2, design: .rounded))
                            }
                        }
                        .frame(height: UIScreen.main.bounds.height / 4)
                        .padding()
                        
                        Button {
                            print("Image tapped!")
                        } label: {
                            
                            HStack() {
                                Text("Add To Cart")
                                    .foregroundColor(.white)
                                    .font(.system(.title, design: .rounded))
                                
                                Spacer()
                                
                                Image(systemName: "bag")
                                    .foregroundColor(.white)
                                    .font(.system(.title, design: .rounded))
                            }
                            .padding(20)
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
            productDetailsViewModel.getProduct(with: id) {
                print("success")
            }
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(id: 1)
    }
}

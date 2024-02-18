//
//  ProductDetailsView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var productDetailsViewModel = ProductDetailsViewModel(networkManager: NetworkManager(), product: Product(id: Int(), title: String(), description: String(), price: Int(), discountPercentage: Double(), rating: Double(), stock: Int(), brand: String(), category: String(), thumbnail: URL(fileURLWithPath: String()), images: [URL]()))
    
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
                                Text(productDetailsViewModel.product.brand)
                                    .foregroundColor(.black)
                                    .font(.system(.title2, design: .rounded))
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.pink)
                                
                                Text("\(productDetailsViewModel.product.rating, specifier: "%.2f")")
                                    .foregroundColor(.black)
                                    .font(.system(.title2, design: .rounded))
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Desription: ")
                                    .foregroundColor(.gray)
                                    .font(.system(.headline, design: .rounded))
                                
                                Text(productDetailsViewModel.product.description)
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
                                
                                Text("$\(productDetailsViewModel.product.price)")
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
            productDetailsViewModel.getProduct(with: id)
        }
    }
}

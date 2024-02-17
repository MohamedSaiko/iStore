//
//  ProductDetailsView.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var productDetailsViewModel = ProductDetailsViewModel(networkManager: NetworkManager())
    
    var id: Int
    
    var body: some View {
        NavigationView {
//            if productDetailsViewModel.isloading {
//                ProgressView()
//            } else {
            VStack() {
                    ProductDetailsTabView(product: productDetailsViewModel.product)
                        .frame(maxWidth: .infinity, maxHeight: 300)

                    Text("Brand: " + productDetailsViewModel.getProductBrand())
                        .foregroundColor(.black)
                        .font(.system(.title, design: .rounded))
                    
                    Button {
                        print("Image tapped!")
                    } label: {
                        Text("Add To Cart")
                            .foregroundColor(.black)
                            .font(.system(.largeTitle, design: .rounded))
                    }
                    
                    Spacer()
                }
                //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(.gray)
            //}
        }
        .navigationTitle(productDetailsViewModel.product?.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        //.environment(\.defaultMinListHeaderHeight, 1)
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

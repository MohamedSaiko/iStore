//
//  CartView.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartViewModel = CartViewModel(networkManager: NetworkManager(), cartManager: CartNetworkManager())
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack() {
                if cartViewModel.carts.isEmpty {
                    ContentUnavailableView("No products", systemImage: "cart", description: Text("You don't have any productss yet."))
                } else {
                    CartList(carts: cartViewModel.carts)
                        .listStyle(.plain)
                    
                    CheckOutButton(total: cartViewModel.carts[0].total) {
                        print("CheckOut Pressed")
                    }
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            cartViewModel.loadUserCarts(withUserId: authenticationViewModel.user.id) { result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        cartViewModel.carts.removeAll()
                        cartViewModel.carts.append(contentsOf: data.carts)
                    }
                case .failure(let error):
                    print(NetworkError.unknownError(error))
                }
            }
        }
    }
}

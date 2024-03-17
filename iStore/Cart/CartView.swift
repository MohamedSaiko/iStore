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
                    ProgressView()
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
            cartViewModel.loadUserCarts(withUserId: authenticationViewModel.currentUser.id)
        }
    }
}

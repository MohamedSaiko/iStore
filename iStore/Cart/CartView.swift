//
//  CartView.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var cartViewModel = CartViewModel(networkManager: NetworkManager(), cartManager: CartManager())
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                cartViewModel.loadUserCarts()
            }
    }
}

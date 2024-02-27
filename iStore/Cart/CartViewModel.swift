//
//  CartViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import Foundation

final class CartViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    private let cartManager: CartManager
    
    @Published var carts = [CartData]()
    
    init(networkManager: NetworkManager, cartManager: CartManager) {
        self.networkManager = networkManager
        self.cartManager = cartManager
    }
    
    func loadUserCarts() {
        
        let url = userCartURL + "1"
        
        networkManager.loadData(withURL: url) { (result: Result<Cart,NetworkError>) in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.carts.append(contentsOf: data.carts)
                        print(self.carts)
                    }
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
}
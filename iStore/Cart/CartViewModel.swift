//
//  CartViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import Foundation

final class CartViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    private let cartManager: CartNetworkManager
    
    @Published var carts = [CartData]()
    
    init(networkManager: NetworkManager, cartManager: CartNetworkManager) {
        self.networkManager = networkManager
        self.cartManager = cartManager
    }
    
    func loadUserCarts(withUserId userID: Int) {
        
        let url = userCartURL + "\(userID)"
        
        networkManager.loadData(withURL: url) { (result: Result<Cart,NetworkError>) in
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.carts.removeAll()
                        self.carts.append(contentsOf: data.carts)
                    }
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
}

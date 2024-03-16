//
//  ProductDetailsViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import Foundation

final class ProductDetailsViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    private let cartManager: CartNetworkManager
    
    @Published var product: Product
    @Published var isloading = true
    
    init(networkManager: NetworkManager, cartManager: CartNetworkManager, product: Product) {
        self.networkManager = networkManager
        self.cartManager = cartManager
        self.product = product
    }
    
    func getProduct(with id: Int) {
        let url = singleProduct + "\(id)"
        
        networkManager.loadData(withURL: url) { [weak self] (result: Result<Product,NetworkError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.product = data
                        self.isloading = false
                    }
                    
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
    
    func addToCart(WithUserID userID: Int, productID: Int) {
        cartManager.addProduct(WithUserID: userID, productID: productID)
    }
}

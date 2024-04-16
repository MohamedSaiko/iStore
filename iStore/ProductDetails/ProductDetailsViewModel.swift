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
    
    func getProduct(with id: Int, completion: @escaping (Result<Product, NetworkError>) -> Void) {
        let url = singleProductURL + "\(id)"
        
        networkManager.loadData(withURL: url) { (result: Result<Product,NetworkError>) in
            switch result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addToCart(WithUserID userID: Int, productID: Int) {
        cartManager.addProduct(WithUserID: userID, productID: productID)
    }
}

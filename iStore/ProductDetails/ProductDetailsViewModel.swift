//
//  ProductDetailsViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import Foundation

final class ProductDetailsViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    
    @Published var product: Product
    @Published var isloading = true
    
    private var skip = 0
    private let totalNumberOfPosts = 150
    
    
    init(networkManager: NetworkManager, product: Product) {
        self.networkManager = networkManager
        self.product = product
    }
    
    func getProduct(with id: Int) {
        
        let url = singleProduct + "\(id)"
        
        networkManager.loadData(with: url) { [weak self] (result: Result<Product,NetworkError>) in
            
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
}

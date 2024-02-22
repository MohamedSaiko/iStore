//
//  HomeViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    
    @Published var products = [Product]()
    @Published var isloading = true
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts() {
        
        let url = allProductsUrl
        
        networkManager.loadData(with: url) { [weak self] (result: Result<ProductsData,NetworkError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.products.append(contentsOf: data.products)
                    self.isloading = false
                }
                
            case .failure(let error):
                print(NetworkError.unknownError(error))
            }
        }
    }
}

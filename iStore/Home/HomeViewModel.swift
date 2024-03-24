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
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts(completion: @escaping (ProductsData) -> Void) {
        let url = allProductsUrl
        
        networkManager.loadData(withURL: url) { (result: Result<ProductsData,NetworkError>) in
            switch result {
                case .success(let data):
                    completion(data)
                    
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
}

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
    @Published var searchText = ""
    
    var searchProduct: String {
        searchText.lowercased()
    }
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts(completion: @escaping (ProductsData) -> Void) {
        let url = allProductsURL
        
        networkManager.loadData(withURL: url) { (result: Result<ProductsData,NetworkError>) in
            switch result {
                case .success(let data):
                    completion(data)
                    
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
    
    func getFilteredProducts(product: String, completion: @escaping (ProductsData) -> Void) {
        let url = filteredProductsURL + product
        
        networkManager.loadData(withURL: url) { (result: Result<ProductsData,NetworkError>) in
            switch result {
                case .success(let data):
                    completion(data)
                    
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
    
    func showProducts(completion: @escaping (ProductsData) -> Void) {
        if !searchText.isEmpty {
            getFilteredProducts(product: searchProduct) { data in
                completion(data)
            }
        } else {
            getProducts() { data in
                completion(data)
            }
        }
    }
}

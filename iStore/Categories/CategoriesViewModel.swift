//
//  CategoryViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 12.02.24.
//

import Foundation

final class CategoriesViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    
    @Published var products = [Product]()
    @Published var isloading = true
    
    private var skip = 0
    private let totalNumberOfPosts = 150
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts(completion: @escaping () -> Void) {
        
        let url = allProductsUrl + limit + "\(skip)"
        
        networkManager.loadData(with: url, skip: skip) { [weak self] (result: Result<ProductsData,NetworkError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.products.append(contentsOf: data.products)
                    self.isloading = false
                }
                completion()
                self.skip += 10
                
            case .failure(let error):
                print(NetworkError.unknownError(error))
            }
        }
    }
}

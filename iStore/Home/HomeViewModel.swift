//
//  HomeViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    
    @Published var products = [product]()
    
    private var skip = 0
    private let totalNumberOfPosts = 150
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProducts(completion: @escaping () -> Void) {
        
        networkManager.loadData(skip: skip) { [weak self] result in
            
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.products.append(contentsOf: data.products)
                }
                completion()
                self.skip += 10
                
            case .failure(let error):
                print(NetworkError.unknownError(error))
            }
        }
    }
}
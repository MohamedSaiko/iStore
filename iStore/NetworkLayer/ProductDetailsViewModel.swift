//
//  ProductDetailsViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 14.02.24.
//

import Foundation

final class ProductDetailsViewModel: ObservableObject {
    
    private let networkManager: NetworkManager
    
    @Published var product: Product?
    @Published var isloading = true
    
    private var skip = 0
    private let totalNumberOfPosts = 150
    
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getProduct(with id: Int, completion: @escaping () -> Void) {
        
        let url = singleProduct + "\(id)"
        
        networkManager.loadData(with: url, skip: skip) { [weak self] (result: Result<Product,NetworkError>) in
            
            guard let self = self else {
                return
            }
            
            switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.product = data
                        self.isloading = false
                    }
                    completion()
                    self.skip += 10
                    
                case .failure(let error):
                    print(NetworkError.unknownError(error))
            }
        }
    }
    
    func getProductID() -> Int {
        guard let product = product else { return 0 }
        return product.id
    }
    
    func getProductTitle() -> String {
        guard let product = product else { return "" }
        return product.title
    }
    
    func getProductDescription() -> String {
        guard let product = product else { return "" }
        return product.description
    }
    
    func getProductPrice() -> Int {
        guard let product = product else { return 0 }
        return product.price
    }
    
    func getProductDiscountPercentage() -> Double {
        guard let product = product else { return 0.0 }
        return product.discountPercentage
    }
    
    func getProductRating() -> Double {
        guard let product = product else { return 0.0 }
        return product.rating
    }
    
    func getProductStock() -> Int {
        guard let product = product else { return 0 }
        return product.stock
    }
    
    func getProductBrand() -> String {
        guard let product = product else { return "" }
        return product.brand
    }
    
    func getProductCategory() -> String {
        guard let product = product else { return "" }
        return product.category
    }
}

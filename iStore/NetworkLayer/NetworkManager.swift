//
//  NetworkManager.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case networkError
    case decodingError
    case unknownError(Error)
    case noResponse
}

struct NetworkManager {
    
    func loadData(skip: Int,completion: @ escaping (Result<productsData, NetworkError>) -> Void) {
        
        let url = URL(string: allProductsUrl + limit + "\(skip)")
        
        guard let url = url else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.networkError))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      completion(.failure(.noResponse))
                      return
                  }
            
            do {
                let jsonProducts = try JSONDecoder().decode(productsData.self, from: data)
                completion(.success(jsonProducts))
            }
            catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
}

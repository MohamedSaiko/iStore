//
//  CartManager.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import Foundation

enum CartRequestError: Error {
    case invalidCart
    case encodingError
    case invalidCartURL
    case cartDataDecodingError
    case serverResponseError
}

struct CartManager {
    
    func addProduct() {
        let cartProducts = [["id": 1,
                             "quantity": 1]]
        
        let cart = CartRequestBody(userId: 1, products: cartProducts)
        
        guard let uploadData = try? JSONEncoder().encode(cart) else {
            print(CartRequestError.encodingError)
            return
        }
        
        let url = URL(string: addToCartURL)
        
        guard let url = url else {
            print(CartRequestError.invalidCartURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response , error in
            
            if error != nil {
                print (CartRequestError.invalidCart)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      print (CartRequestError.serverResponseError)
                      return
                  }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                
                print ("got data: \(dataString)")
            }
        }
        task.resume()
    }
}
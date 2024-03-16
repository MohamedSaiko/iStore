//
//  AuthenticationManager.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

enum AuthenticationError: Error {
    case invalidcrdentials
    case encodingError
    case invalidAuthenticationURL
    case userDataDecodingError
    case serverResponseError
    case invalidCurrentUserURL
    case networkError
    case decodingError
}

struct AuthenticationManager {
    
    func authenticate(userName: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        let user: [String : String] = [
            "username": userName,
            "password": password
        ]
        
        guard let uploadData = try? JSONEncoder().encode(user) else {
            print(AuthenticationError.encodingError)
            return
        }
        
        let url = URL(string: authenticationUrl)
        
        guard let url = url else {
            print(AuthenticationError.invalidAuthenticationURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response , error in
            if error != nil {
                print (AuthenticationError.invalidcrdentials)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      print (AuthenticationError.serverResponseError)
                      return
                  }
            
            if let data = data {
                do {
                    let jsonUser = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(jsonUser.token))
                }
                catch {
                    completion(.failure(AuthenticationError.decodingError))
                }
            }
        }
        task.resume()
    }
    
    func getCurrentUser(withToken token: String, completion: @escaping (CurrentAuthenticatedUser) -> Void) {
        
        let url = URL(string: currentUserURL)
        
        guard let url = url else {
            print(AuthenticationError.invalidCurrentUserURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(AuthenticationError.networkError)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                      print (AuthenticationError.serverResponseError)
                      return
                  }
            
            do {
                let currentAuthenticatedUser = try JSONDecoder().decode(CurrentAuthenticatedUser.self, from: data)
                completion(currentAuthenticatedUser)
            }
            catch {
                print(AuthenticationError.decodingError)
            }
        }
        task.resume()
    }
}

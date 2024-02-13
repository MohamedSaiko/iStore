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
}

struct AuthenticationManager {
    
    func authenticate(userName: String, password: String, completion: @escaping () -> Void) {
        
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
            
            if let data = data,
               let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
                completion()
            }
        }
        task.resume()
    }
}

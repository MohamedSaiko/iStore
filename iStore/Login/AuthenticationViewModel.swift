//
//  LoginViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    private let authenticationManager: AuthenticationManager
    
    @Published var user: AuthenticatedUser
    @Published var userName: String
    @Published var password: String
    @Published var showError = false
    @Published var showProgress = false
    
    init(authenticationManager: AuthenticationManager, user: AuthenticatedUser, userName: String, password: String) {
        self.authenticationManager = authenticationManager
        self.user = user
        self.userName = userName
        self.password = password
    }
    
    func authenticateUser(completion: @escaping (Result<AuthenticatedUser, AuthenticationError>) -> Void) {
        authenticationManager.authenticate(userName: userName, password: password) { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case .success(let token):
                self.authenticationManager.getCurrentUser(withToken: token) { currentUser in
                    completion(.success(currentUser))
                }
                
            case .failure(_):
                completion(.failure(AuthenticationError.invalidCurrentUserURL))
            }
        }
    }
}

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
    @Published var showError = false
    @Published var showProgress = false
    @Published var isGuest = false
    
    init(authenticationManager: AuthenticationManager, user: AuthenticatedUser) {
        self.authenticationManager = authenticationManager
        self.user = user
    }
    
    func authenticateUser(userName: String, password: String, completion: @escaping (Result<AuthenticatedUser, AuthenticationError>) -> Void) {
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

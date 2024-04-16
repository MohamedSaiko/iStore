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
    
    func authenticateUser(userName: String, password: String, completion: @escaping () -> Void) {
        authenticationManager.authenticate(userName: userName, password: password) { [weak self] result in
            
            guard let self = self else {
                return
            }
            
            switch result {
                case .success(let token):
                    self.authenticationManager.getCurrentUser(withToken: token) { currentUser in
                        DispatchQueue.main.async {
                            self.user = currentUser
                            completion()
                        }
                    }
                    
                case .failure(_):
                    DispatchQueue.main.async {
                        self.showError = true
                    }
            }
        }
    }
}

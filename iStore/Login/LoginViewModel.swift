//
//  LoginViewModel.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    private let authenticationManager: AuthenticationManager
    @Published var currentUser: CurrentAuthenticatedUser
    
    init(authenticationManager: AuthenticationManager, currentUser: CurrentAuthenticatedUser) {
        self.authenticationManager = authenticationManager
        self.currentUser = currentUser
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
                            self.currentUser = currentUser
                            completion()
                        }
                    }
                    
                case .failure(let authenticationError):
                    print(authenticationError)
            }
        }
    }
}

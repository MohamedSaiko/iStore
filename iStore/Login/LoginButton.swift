//
//  LoginButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct LoginButton: View {
    
    @EnvironmentObject var loginViewModel: AuthenticationViewModel
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    private let userName: String
    private let password: String
    
    @State private var shouldNavigate: Bool = false
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    var body: some View {
        Button("Login") {
            loginViewModel.showProgress = true
            loginViewModel.showError = false
            
            loginViewModel.authenticateUser(userName: userName, password: password) {
                navigationCoordinator.switchView = .contentView
                loginViewModel.showProgress = false
            }
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .background(.pink)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

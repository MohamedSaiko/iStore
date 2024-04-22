//
//  LoginView.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authenticationViewModel: AuthenticationViewModel
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("iStore")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 25)
                .padding(.horizontal)
            
            Text("Get Everything at Your Doorstep")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .padding()
            
            Spacer()
            
            VStack(spacing: 24) {
                UserNameView(userName: $authenticationViewModel.userName)
                
                PasswordView(password: $authenticationViewModel.password)
                
                if authenticationViewModel.showError {
                    Text("Please, Enter a valid UserName and Password!")
                        .foregroundColor(.red)
                } else if authenticationViewModel.showProgress {
                    ProgressView()
                }
            }
            .padding()
            
            VStack(alignment: .center, spacing: 15) {
                LoginButton {
                    authenticationViewModel.showProgress = true
                    authenticationViewModel.showError = false
                    
                    authenticationViewModel.authenticateUser() { result in
                        switch result {
                        case .success(let currentUser):
                            DispatchQueue.main.async {
                                authenticationViewModel.user = currentUser
                                navigationCoordinator.user = currentUser
                                navigationCoordinator.switchView = .contentView
                                authenticationViewModel.showProgress = false
                            }
                            
                        case .failure(_):
                            DispatchQueue.main.async {
                                authenticationViewModel.showError = true
                            }
                        }
                    }
                }
                
                Button("Continue as a Guest") {
                    navigationCoordinator.switchView = .contentView
                    navigationCoordinator.isGuest = true
                }
            }
            .padding()
        }
    }
}

//
//  LoginButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct LoginButton: View {
    
    @StateObject var loginViewModel = LoginViewModel(authenticationManager: AuthenticationManager(), currentUser: CurrentAuthenticatedUser(id: Int()))
    
    private let userName: String
    private let password: String
    
    @State private var shouldNavigate: Bool = false
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    var body: some View {
        NavigationLink(destination: ContentView(loginViewModel: loginViewModel), isActive: $shouldNavigate) {
            Text("Login")
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(.pink)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    loginViewModel.authenticateUser(userName: userName, password: password) {
                        shouldNavigate = true
                    }
                }
        }
    }
}

//
//  LoginView.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var userName: String
    @State private var password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
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
                UserNameStack(userName: $userName)
                
                PasswordStack(password: $password)
                
                if loginViewModel.showError {
                    Text("Please, Enter a valid UserName and Password!")
                        .foregroundColor(.red)
                }
                
                if loginViewModel.showProgress {
                    ProgressView()
                }
            }
            .padding()
            
            VStack(alignment: .center, spacing: 15) {
                LoginButton(userName: userName, password: password)
                
                RegisterButton()
            }
            .padding()
        }
    }
}

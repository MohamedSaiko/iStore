//
//  ViewManager.swift
//  iStore
//
//  Created by Mohamed Sayed on 16.03.24.
//

import SwiftUI

struct ViewManager: View {
    
    @StateObject var navigationCoordinator: NavigationCoordinator
    @StateObject var loginViewModel: AuthenticationViewModel
    
    var body: some View {
        switch navigationCoordinator.switchView {
            case .loginView:
                LoginView(userName: "", password: "")
                    .environmentObject(navigationCoordinator)
                    .environmentObject(loginViewModel)
                
            case .contentView:
                ContentView()
                    .environmentObject(navigationCoordinator)
                    .environmentObject(loginViewModel)
                
            case .registerView:
                Text("Register")
                    .environmentObject(navigationCoordinator)
        }
    }
}

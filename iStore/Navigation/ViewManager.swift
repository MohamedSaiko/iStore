//
//  ViewManager.swift
//  iStore
//
//  Created by Mohamed Sayed on 16.03.24.
//

import SwiftUI

struct ViewManager: View {
    @StateObject var navigationCoordinator: NavigationCoordinator
    @StateObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var locationDataManager: LocationDataManager
    
    var body: some View {
        switch navigationCoordinator.switchView {
            case .loginView:
                LoginView(userName: "kminchelle", password: "0lelplR")
                    .environmentObject(navigationCoordinator)
                    .environmentObject(authenticationViewModel)
                
            case .contentView:
                ContentView()
                    .environmentObject(navigationCoordinator)
                    .environmentObject(authenticationViewModel)
                    .environmentObject(locationDataManager)
        }
    }
}

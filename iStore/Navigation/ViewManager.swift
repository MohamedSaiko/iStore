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
            LoginView()
                .environmentObject(navigationCoordinator)
                .environmentObject(authenticationViewModel)
            
        case .contentView:
            ContentView(user: navigationCoordinator.user, isGuest: navigationCoordinator.isGuest)
                .environmentObject(navigationCoordinator)
                .environmentObject(authenticationViewModel)
                .environmentObject(locationDataManager)
        }
    }
}

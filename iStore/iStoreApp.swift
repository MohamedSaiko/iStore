//
//  iStoreApp.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

@main
struct iStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ViewManager(navigationCoordinator: NavigationCoordinator(), loginViewModel: LoginViewModel(authenticationManager: AuthenticationManager(), currentUser: CurrentAuthenticatedUser(id: Int())))
        }
    }
}

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
            ViewManager(navigationCoordinator: NavigationCoordinator(), authenticationViewModel: AuthenticationViewModel(authenticationManager: AuthenticationManager(), user: AuthenticatedUser(id: Int())))
        }
    }
}

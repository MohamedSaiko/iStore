//
//  NavigationCoordinator.swift
//  iStore
//
//  Created by Mohamed Sayed on 16.03.24.
//

import Foundation

enum CurrentView {
    case loginView
    case contentView
}

final class NavigationCoordinator: ObservableObject {
    @Published var switchView = CurrentView.loginView
    @Published var user: AuthenticatedUser
    @Published var isGuest = false
    
    init(user: AuthenticatedUser) {
        self.user = user
    }
}

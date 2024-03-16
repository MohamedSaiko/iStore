//
//  RegisterButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct RegisterButton: View {
    
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    
    var body: some View {
        Button("Register") {
            navigationCoordinator.switchView = .registerView
        }
    }
}

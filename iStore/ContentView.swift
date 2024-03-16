//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 10.02.24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        TabView {
            HomeView(userID: loginViewModel.currentUser.id)
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "tray.fill")
                }
            
            CartView(userID: loginViewModel.currentUser.id)
                .tabItem {
                    Image(systemName: "bag.fill")
                }
            
            Text("account")
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                }
        }
        .accentColor(.pink)
    }
}

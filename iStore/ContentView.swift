//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 10.02.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "tray.fill")
                }
            
            CartView()
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

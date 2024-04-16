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
            
            CartView()
                .tabItem {
                    Image(systemName: "bag.fill")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .tint(.pink)
    }
}

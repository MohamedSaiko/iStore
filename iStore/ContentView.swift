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
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            Category()
                .tabItem {
                    Image(systemName: "tray.fill")
                }
            
            Text("cart")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

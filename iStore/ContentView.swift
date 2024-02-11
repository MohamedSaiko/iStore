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
                    Label("",systemImage: "house.fill")
                }
            
            Category()
                .tabItem {
                    Label("",systemImage: "tray.fill")
                }
            
            Text("cart")
                .tabItem {
                    Label("",systemImage: "bag.fill")
                }
            
            Text("account")
                .tabItem {
                    Label("",systemImage: "line.3.horizontal")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

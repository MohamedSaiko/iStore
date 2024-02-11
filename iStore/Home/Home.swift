//
//  ContentView.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import SwiftUI

struct Home: View {
    
    @State private var text = ""
    
    var body: some View {
        NavigationView {
                VStack() {
                    LocationButton()
                    
                    Spacer()
                    
                    ProductsGrid()
                }
                .searchable(text: $text)
                .padding(.horizontal)
                .navigationTitle("iStore")
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home()
        }
    }
}

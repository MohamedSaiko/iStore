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
            ZStack {
                VStack() {
                    LocationButton()
                    
                    ProductsGrid()
                }
                .searchable(text: $text)
                .padding()
                .background(.regularMaterial)
                .navigationTitle("iStore")
            }
            .background(.gray)
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

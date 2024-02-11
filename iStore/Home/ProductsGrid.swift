//
//  SwiftUIView.swift
//  iStore
//
//  Created by Mohamed Sayed on 09.02.24.
//

import SwiftUI

struct ProductsGrid: View {
    
    private var data  = Array(1...20)
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150, maximum: 180))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: adaptiveColumn) {
                ForEach(data, id: \.self) { item in
                    NavigationLink {
                        Text("hello world")
                    } label: {
                        VStack(alignment: .center) {
                            Image(systemName: "rectangle.portrait.fill")
                                .frame(minWidth: 80, minHeight: 114, alignment: .center)
                                .font(.largeTitle)
                                .foregroundColor(.green)
                                .background(.green)
                            
                            Text(String(item))
                                .foregroundColor(.black)
                                .font(.subheadline)
                        }
                        .frame(width: 170, height: 170, alignment: .center)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(5)
                    }
                }
            }
        }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid()
    }
}

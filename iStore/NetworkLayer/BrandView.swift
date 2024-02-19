//
//  BrandHStack.swift
//  iStore
//
//  Created by Mohamed Sayed on 18.02.24.
//

import SwiftUI

struct BrandView: View {
    
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Text(product.brand)
                .foregroundColor(.black)
                .font(.system(.title2, design: .rounded))
            
            Spacer()
            
            Image(systemName: "star.fill")
                .foregroundColor(.pink)
            
            Text("\(product.rating, specifier: "%.2f")")
                .foregroundColor(.black)
                .font(.system(.title2, design: .rounded))
        }
    }
}

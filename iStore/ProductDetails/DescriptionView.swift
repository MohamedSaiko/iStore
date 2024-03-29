//
//  DescriptionView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.02.24.
//

import SwiftUI

struct DescriptionView: View {
    
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Desription: ")
                .foregroundColor(.gray)
                .font(.system(.headline, design: .rounded))
            
            Text(product.description)
                .foregroundColor(.black)
                .font(.system(.headline, design: .rounded))
        }
    }
}

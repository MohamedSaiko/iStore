//
//  TotalPriceView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.02.24.
//

import SwiftUI

struct TotalPriceView: View {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        HStack() {
            Text("Total")
                .foregroundColor(.black)
                .font(.system(.title2, design: .rounded))
            
            Spacer()
            
            Text("$\(product.price)")
                .foregroundColor(.pink)
                .font(.system(.title2, design: .rounded))
        }
    }
}

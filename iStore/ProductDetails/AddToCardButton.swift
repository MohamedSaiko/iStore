//
//  AddToCardButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.02.24.
//

import SwiftUI

struct AddToCardButton: View {
    
    private let action: (Int, Int) -> Void
    private let userID: Int
    private let productID: Int
    
    init(action: @escaping (Int, Int) -> Void, userID: Int, productID: Int) {
        self.action = action
        self.userID = userID
        self.productID = productID
    }
    
    var body: some View {
        Button {
            action(userID, productID)
        } label: {
            HStack() {
                Text("Add To Cart")
                    .foregroundColor(.white)
                    .font(.system(.title, design: .rounded))
                
                Spacer()
                
                Image(systemName: "bag")
                    .foregroundColor(.white)
                    .font(.system(.title, design: .rounded))
            }
            .padding(20)
        }
    }
}

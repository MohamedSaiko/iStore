//
//  AddToCardButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.02.24.
//

import SwiftUI

struct AddToCardButton: View {
    
    private let action: (Int) -> Void
    private let userID: Int
    
    init(action: @escaping (Int) -> Void, userID: Int) {
        self.action = action
        self.userID = userID
    }
    
    var body: some View {
        Button {
            action(userID)
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

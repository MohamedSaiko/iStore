//
//  AddToCardButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.02.24.
//

import SwiftUI

struct AddToCardButton: View {
    private let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
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

//
//  CheckOutButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 09.03.24.
//

import SwiftUI

struct CheckOutButton: View {
    
    let total: Int
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text("CheckOut")
                        .foregroundColor(.white)
                        .font(.system(.title, design: .rounded))
                    
                    Text("Total: \(total)")
                        .foregroundColor(.white)
                        .font(.system(.headline, design: .rounded))
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .font(.system(.title, design: .rounded))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

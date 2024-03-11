//
//  CheckOutButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 09.03.24.
//

import SwiftUI

struct CheckOutButton: View {
    
    private let total: Int
    private let action: () -> Void
    
    init(total: Int, action: @escaping () -> Void) {
        self.total = total
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text("CheckOut")
                        .foregroundColor(.white)
                        .font(.system(.title, design: .rounded))
                    
                    Text("Total: $\(total)")
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

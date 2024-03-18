//
//  PasswordStack.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct PasswordView: View {
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Password")
                .font(.subheadline)
                .fontWeight(.bold)
            
            SecureField("Enter your Password", text: $password)
                .textFieldStyle(.roundedBorder)
        }
    }
}

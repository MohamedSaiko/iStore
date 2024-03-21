//
//  UserNameStack.swift
//  iStore
//
//  Created by Mohamed Sayed on 13.03.24.
//

import SwiftUI

struct UserNameView: View {
    @Binding var userName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("User Name")
                .font(.subheadline)
                .fontWeight(.bold)
            
            TextField("Enter your User Name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.pink)
        }
    }
}

//
//  PersonalDetailsView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import SwiftUI

struct PersonalDetailsView: View {
    private let userName: String
    private let firstName: String
    private let lastName: String
    private let email: String
    private let phone: String
    
    init(userName: String, firstName: String, lastName: String, email: String, phone: String) {
        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("UserName")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(userName)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Name")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(firstName + " " + lastName)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Email")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(email)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Phone")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(phone)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
    }
}

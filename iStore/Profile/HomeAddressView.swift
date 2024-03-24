//
//  HomeAddressView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import SwiftUI

struct HomeAddressView: View {
    private let address: String
    private let city: String
    private let postalCode: String
    private let state: String
    
    init(address: String, city: String, postalCode: String, state: String) {
        self.address = address
        self.city = city
        self.postalCode = postalCode
        self.state = state
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Address")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(address)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Postal Code")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(postalCode)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("City")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(city)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text("State")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(state)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.black)
        }
    }
}

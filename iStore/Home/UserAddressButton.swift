//
//  LocationButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 10.02.24.
//

import SwiftUI

struct UserAddressButton: View {
    private let address: String
    private let postalCode: String
    private let city: String
    private let state: String
    private let latitude: Double
    private let longitude: Double
    
    init(address: String, postalCode: String, city: String, state: String, latitude: Double, longitude: Double) {
        self.address = address
        self.postalCode = postalCode
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var body: some View {
        NavigationLink {
            LocationView(address: address, postalCode: postalCode, city: city, state: state, latitude: latitude, longitude: longitude)
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "map.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.pink)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Delivery Address")
                        .font(.system(.subheadline, design: .rounded))
                        .opacity(0.5)
                    
                    VStack(alignment: .leading) {
                        Text(address + ", ")
                            .font(.system(.headline, design: .rounded))
                        
                        Text("\(postalCode) " + city + ", " + state)
                            .font(.system(.headline, design: .rounded))
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
        }
        .tint(.black)
    }
}

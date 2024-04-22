//
//  ProfileView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import SwiftUI

struct ProfileView: View {
    private let username: String
    private let firstName: String
    private let lastName: String
    private let maidenName: String
    private let email: String
    private let phone: String
    private let image: URL
    private let homeAddress: String
    private let homePostalCode: String
    private let homeCity: String
    private let homeState: String
    
    private let isGuest: Bool
    
    init(username: String, firstName: String, lastName: String, maidenName: String, email: String, phone: String, image: URL, homeAddress: String, homePostalCode: String, homeCity: String, homeState: String, isGuest: Bool) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.maidenName = maidenName
        self.email = email
        self.phone = phone
        self.image = image
        self.homeAddress = homeAddress
        self.homePostalCode = homePostalCode
        self.homeCity = homeCity
        self.homeState = homeState
        self.isGuest = isGuest
    }
    
    var body: some View {
        NavigationStack {
            if isGuest {
                ContentUnavailableView("No Profile", systemImage: "person", description: Text("Please Login to Show your Profile."))
                    .symbolVariant(.slash)
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                Form {
                    ProfilePictureView(image: image)
                    
                    PersonalDetailsView(userName: username, firstName: firstName, lastName: lastName, email: email, phone: phone)
                    
                    Section(header: Text("Home Address")) {
                        HomeAddressView(address: homeAddress, city: homeCity, postalCode: homePostalCode, state: homeState)
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

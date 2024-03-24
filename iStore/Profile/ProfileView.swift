//
//  ProfileView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        Form {
            ProfilePictureView(image: authenticationViewModel.user.image)
            
            PersonalDetailsView(userName: authenticationViewModel.user.username, firstName: authenticationViewModel.user.firstName, lastName: authenticationViewModel.user.lastName, email: authenticationViewModel.user.email, phone: authenticationViewModel.user.phone)
            
            Section(header: Text("Home Address")) {
                HomeAddressView(address: authenticationViewModel.user.address.address, city: authenticationViewModel.user.address.city, postalCode: authenticationViewModel.user.address.postalCode, state: authenticationViewModel.user.address.state)
            }
        }
    }
}

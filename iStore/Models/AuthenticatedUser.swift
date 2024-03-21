//
//  AuthenticatedUser.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import Foundation

struct AuthenticatedUser: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let maidenName: String
    let email: String
    let phone: String
    let image: URL
    let address: HomeAddress
}

struct HomeAddress: Decodable {
    let address: String
    let city: String
    let postalCode: String
    let coordinates: Coordinates
    let state: String
}

struct Coordinates: Decodable {
    let lat: Double
    let lng: Double
}

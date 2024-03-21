//
//  User.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let token: String
}

struct AuthenticatedUser: Codable {
    let id: Int
}

enum CodingKeys: String, CodingKey {
    case userName = "username"
}

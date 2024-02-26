//
//  CartData.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import Foundation

struct CartData: Decodable, Identifiable {
    let id: String
    let title: String
    let price: Int
    let quantity: Int
    let total: Int
    let discountPercentage: Double
    let discountedPrice: Int
    let thumbnail: String
}

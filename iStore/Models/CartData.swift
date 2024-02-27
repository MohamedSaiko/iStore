//
//  CartData.swift
//  iStore
//
//  Created by Mohamed Sayed on 26.02.24.
//

import Foundation


struct Cart: Decodable {
    let carts: [CartData]
}

struct CartData: Decodable, Identifiable {
    let id: Int
    let products: [CartProduct]
    let total: Int
    let discountedTotal: Int
    let userId: Int
    let totalProducts: Int
    let totalQuantity: Int
}

struct CartProduct: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Int
    let quantity: Int
    let total: Int
    let discountPercentage: Double
    let discountedPrice: Int
    let thumbnail: String
}

struct CartRequestBody: Encodable {
    let userId: Int
    let products: [[String: Int]]
}

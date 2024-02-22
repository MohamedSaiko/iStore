//
//  PostsData.swift
//  iStore
//
//  Created by Mohamed Sayed on 17.01.24.
//

import Foundation

struct ProductsData: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: URL
    let images: [URL]
}

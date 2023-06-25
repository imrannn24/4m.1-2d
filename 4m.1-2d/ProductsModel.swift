//
//  ProductsModel.swift
//  4m.1d
//
//  Created by imran on 25.06.2023.
//

import Foundation

struct ProductsModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}
 
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}

//
//  ProductModel.swift
//
//  Created by Geraldine on 30/10/24.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [ProductModel]
}

struct ProductModel: Hashable, Codable {
    let id: Int?
    let title: String
    let description: String
    let price: Double
    let stock: Double
    let thumbnail: String
    let category: String?
    let brand: String?
    let discountPercentage: Double?
}

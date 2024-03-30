//
//  StoreType.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 27/03/24.
//

import Foundation

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let distance: Double
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, location, stars, products, distance
        case logoImage = "logo_image"
        case headerImage = "header_image"
    }
}

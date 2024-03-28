//
//  Double+.swift
//  ChefDelivery
//
//  Created by Nor, Gustavo on 28/03/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}

//
//  ConcertsResponse.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import Foundation

struct ConcertListResponse: Decodable {
    let offers: [Offer]
}

struct Offer: Decodable, Identifiable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Price: Decodable {
    let value: Int
}

extension Price {
    var formattedValue: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        let number = Double(self.value)
        if let formattedString = formatter.string(from: NSNumber(value: number)) {
            return "от " + formattedString + " ₽" 
        }
        return String(self.value)
    }
}



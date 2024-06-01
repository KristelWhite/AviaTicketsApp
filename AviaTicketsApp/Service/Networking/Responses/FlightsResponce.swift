//
//  FlightsResponce.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import Foundation

struct FligthListResponse: Decodable {
    let ticketsOffers: [TicketOffer]

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

struct TicketOffer: Decodable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case timeRange = "time_range"
    }
}

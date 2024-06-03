//
//  TicketsResponse.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import Foundation


struct TicketListResponce: Decodable {
    var tickets: [TicketResponce]
}

struct TicketResponce: Decodable {
    var badge: String?
    var price: Price
    var departure: Departure
    var arrival: Arrival
    var hasTransfer: Bool

    enum CodingKeys: String, CodingKey {
        case badge, price, departure, arrival
        case hasTransfer = "has_transfer"
    }
}

struct Departure: Decodable {
    var date: String
    var airport: String
}

struct Arrival: Decodable {
    var date: String
    var airport: String
}

//extension DateFormatter {
//    static let ticketDateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }()
//}
//
//extension JSONDecoder {
//    static let ticketDecoder: JSONDecoder = {
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .formatted(DateFormatter.ticketDateFormatter)
//        return decoder
//    }()
//}
//
//var flightDuration: String {
//    let departureDate = departure.date
//    let arrivalDate = arrival.date
//    return formatDuration(from: departureDate, to: arrivalDate)
//}
//
//var transferInfo: String? {
//    return hasTransfer ? nil : "/Без пересадок"
//}
//
//private func formatDuration(from start: Date, to end: Date) -> String {
//    let interval = end.timeIntervalSince(start)
//    let hours = Int(interval) / 3600
//    let minutes = Int(interval) % 3600 / 60
//    return "\(hours)ч \(minutes)м"
//}

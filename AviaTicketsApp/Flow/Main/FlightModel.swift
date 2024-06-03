//
//  MainModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

struct FlightModel {
    var cityFrom: String?
    var cityTo: String?
}

struct Concert: Hashable {
    let artist: String
    let city: String
    let price: String
    let image: UIImage
}

enum ConcertImage {
    static func getImage(for id: Int) -> UIImage {
        switch id {
        case 1:
            return Asset.dieAntwoord.image
        case 2:
           return  Asset.socrat.image
        case 3:
            return Asset.lampa.image
        default:
            print("unexpected items value")
            return Asset.dieAntwoord.image
        }
    }
}

//
//  MainModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

struct MainModel {
    let cityFrom: String
    let cityTo: String
}

struct Concert: Hashable {
    let artist: String
    let city: String
    let price: String
    let image: UIImage
}

enum ConcertImage {
//    case first
//    case second
//    case third
//
//    var image: UIImage {
//        switch self {
//        case .first:
//            return Asset.dieAntwoord.image
//        case .second:
//            return Asset.socrat.image
//        case .third:
//            return Asset.lampa.image
//        }
//    }
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

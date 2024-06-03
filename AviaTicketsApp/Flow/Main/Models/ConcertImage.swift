//
//  ConcertImage.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

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

//
//  RouteSuggestionsModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

enum FligthColor {
    static func getColor(for id: Int) -> UIColor {
        switch id {
        case 1:
            return Palette.red.color
        case 10:
            return Palette.priceBlue.color
        case 30:
            return Palette.white.color
        default:
            print("unexpected items value")
            return Palette.grey7.color
        }
    }
}

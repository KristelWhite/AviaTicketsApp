//
//  ColorPalett.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 31.05.2024.
//

import UIKit

enum Palette {
    case black
    case grey1
    case grey2
    case grey3
    case grey4
    case grey5
    case grey6
    case grey7
    case white
    case blue
    case darkBlue
    case green
    case darkGreen
    case red
    case orange
    case extraBlack
    case priceBlue

    var color: UIColor {
        switch self {
        case .black:
            return UIColor(hex: "#0C0C0C")
        case .grey1:
            return UIColor(hex: "#1D1E20")
        case .grey2:
            return UIColor(hex: "#242529")
        case .grey3:
            return UIColor(hex: "#2F3035")
        case .grey4:
            return UIColor(hex: "#3E3F43")
        case .grey5:
            return UIColor(hex: "#5E5F61")
        case .grey6:
            return UIColor(hex: "#9F9F9F")
        case .grey7:
            return UIColor(hex: "#DBDBDB")
        case .white:
            return UIColor(hex: "#FFFFFF")
        case .blue:
            return UIColor(hex: "#4C95FE")
        case .priceBlue:
            return UIColor(hex: "#2261BC")
        case .darkBlue:
            return UIColor(hex: "#00427D")
        case .green:
            return UIColor(hex: "#4CB24E")
        case .darkGreen:
            return UIColor(hex: "#015905")
        case .red:
            return UIColor(hex: "#FF0000")
        case .orange:
            return UIColor(hex: "#F36E36")
        case .extraBlack:
            return UIColor(hex: "#000000")
        }
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1 // skip the #
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

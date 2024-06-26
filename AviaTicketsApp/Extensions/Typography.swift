//
//  Typography.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 31.05.2024.
//

import UIKit

enum Typography {
    case title1
    case title2
    case title3
    case title4
    case text1
    case text2
    case buttonText
    case tabText
    case italicButtonText

    var font: UIFont {
        switch self {
        case .title1:
            return UIFont.systemFont(ofSize: 22.0, weight: .semibold)
        case .title2:
            return UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        case .title3:
            return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        case .title4:
            return UIFont.italicSystemFont(ofSize: 14)
        case .text1:
            return UIFont.systemFont(ofSize: 16.0, weight: .regular)
        case .text2:
            return UIFont.systemFont(ofSize: 14.0, weight: .regular)
        case .buttonText:
            return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        case .italicButtonText:
            return UIFont.italicSystemFont(ofSize: 16.0)
        case .tabText:
            return UIFont.systemFont(ofSize: 10.0, weight: .regular)
        }
    }
}

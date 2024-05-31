//
//  TabBarModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

enum TabBarModel: CaseIterable {
    case avia
    case hotels
    case about
    case subscriptions
    case profile

    var label: String {
        switch self {
        case .profile:
            return Common.profile
        case .avia:
            return Common.avia
        case .hotels:
            return Common.hotels
        case .about:
            return Common.about
        case .subscriptions:
            return Common.subscriptions
        }
    }
    var image: UIImage? {
        switch self {
        case .profile:
            return UIImage(named: "profileTab")
        case .avia:
            return UIImage(named: "profileTab")
        case .hotels:
            return UIImage(named: "profileTab")
        case .about:
            return UIImage(named: "profileTab")
        case .subscriptions:
            return UIImage(named: "profileTab")
        }
    }
    var selectedImage: UIImage? {
        return image
    }

}


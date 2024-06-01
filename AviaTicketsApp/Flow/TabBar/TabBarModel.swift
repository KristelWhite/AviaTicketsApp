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
            return Asset.profile.image
        case .avia:
            return Asset.avia.image
        case .hotels:
            return Asset.bed.image
        case .about:
            return Asset.location.image
        case .subscriptions:
            return Asset.followingsOn.image
        }
    }
    var selectedImage: UIImage? {
        return image
    }

}


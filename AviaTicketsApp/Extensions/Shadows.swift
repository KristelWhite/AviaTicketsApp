//
//  Shadows.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import UIKit

enum Shadow {
    case base

    func apply(to view: UIView) {
        switch self {
        case .base:
            view.layer.shadowColor = Palette.extraBlack.color.cgColor
            view.layer.shadowOpacity = 0.25
            view.layer.shadowOffset = CGSize(width: 0, height: 4)
            view.layer.shadowRadius = 4
        }
    }
}


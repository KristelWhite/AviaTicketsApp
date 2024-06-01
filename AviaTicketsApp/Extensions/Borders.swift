//
//  Borders.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import UIKit

enum Border {
    case base

    func apply(to view: UIView) {
        switch self {
        case .base:
            view.layer.borderColor = Palette.extraBlack.color.cgColor
            view.layer.borderWidth = 1
        }
    }

    func apply(to label: UILabel, with text: String) {
        switch self {
        case .base:
            let strokeTextAttributes: [NSAttributedString.Key: Any] = [
                .strokeColor: Palette.extraBlack.color,
                .strokeWidth: -1.0
            ]

            let attributedText = NSAttributedString(string: text, attributes: strokeTextAttributes)
            label.attributedText = attributedText
        }
    }
}

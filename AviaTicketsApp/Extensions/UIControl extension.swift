//
//  UIControl extension.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit.UIControl

public extension UIControl {

    func isEnabled(_  isEnabled: Bool)  {
        self.isEnabled = isEnabled
    }

    @available(iOS 14.0, *)
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> Void) {
        addAction(UIAction { _ in closure() }, for: controlEvents)
    }

    @available(iOS 14.0, *)
    func onTap(_ closure: @escaping () -> Void) {
        addAction(for: .touchUpInside, closure)

    }
}

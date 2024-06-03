//
//  CommingSoonCoordinator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class CommingSoonCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(PlugViewController(), animated: false)
    }
}

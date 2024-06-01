//
//  AviaCoordinator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 31.05.2024.
//
import UIKit

class AviaCoordinator: Coordinator {
    var navigationController: UINavigationController
    var rootController: UIViewController

    init(navigationController: UINavigationController, rootController: UIViewController) {
        self.navigationController = navigationController
        self.rootController = rootController
    }

    func start() {
//        navigationController.pushViewController(vc, animated: false)
    }
}
class CommingSoonCoordinator: Coordinator {
    var navigationController: UINavigationController
    var rootController: UIViewController

    init(navigationController: UINavigationController, rootController: UIViewController) {
        self.navigationController = navigationController
        self.rootController = rootController
    }

    func start() {
//        navigationController.pushViewController(vc, animated: false)
    }
}

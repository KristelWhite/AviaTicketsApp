//
//  TabBarConfigurator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

class TabBarConfigurator {

    init(tabs: [TabBarModel]) {
        self.allTab = tabs
    }

    //MARK: - private property
    private let allTab: [TabBarModel]

    //MARK: - Internal func
    func configure() -> UITabBarController {
        return getTabBarController()
    }

//    // Method to present a view controller
//    func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
//        tabBarController.present(viewController, animated: animated, completion: completion)
//    }
//
//    // Method to push a view controller on the current navigation stack
//    func push(_ viewController: UIViewController, animated: Bool = true) {
//        if let navController = tabBarController.selectedViewController as? UINavigationController {
//            navController.pushViewController(viewController, animated: animated)
//        }
//    }
//
//    // Method to pop a view controller from the current navigation stack
//    func pop(animated: Bool = true) {
//        if let navController = tabBarController.selectedViewController as? UINavigationController {
//            navController.popViewController(animated: animated)
//        }
//    }
//
//    // Method to dismiss a presented view controller
//    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
//        tabBarController.dismiss(animated: animated, completion: completion)
//    }
}

private extension TabBarConfigurator {
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getControllers()
        return tabBarController
    }

    func getControllers() -> [UIViewController]{
        var viewControllers: [UIViewController] = []

        allTab.forEach { tab in
            let navigationController = UINavigationController(rootViewController: getCurrentViewController(tab: tab))
            let tabBarItem = UITabBarItem(title: tab.label, image: tab.image, selectedImage: tab.selectedImage)
            navigationController.tabBarItem = tabBarItem
            viewControllers.append(navigationController)
        }
        return viewControllers
    }

    func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .avia:
            let vc = MainViewController()
            let viewModel = MainViewModel()
            vc.viewModel = viewModel
            return vc
        case .profile:
            return CommingSoonViewController()
        case .hotels:
            return CommingSoonViewController()
        case .about:
            return CommingSoonViewController()
        case .subscriptions:
            return CommingSoonViewController()
        }
    }
}


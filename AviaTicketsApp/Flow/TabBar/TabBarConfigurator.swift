//
//  TabBarConfigurator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

class TabBarConfigurator {
    //MARK: - private property
    private let allTab: [TabBarModel] = [.avia, .hotels, .about, .subscriptions, .profile]

    //MARK: - Internal func
    func configure() -> UITabBarController {
        return getTabBarController()
    }
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
            return MainViewController()
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


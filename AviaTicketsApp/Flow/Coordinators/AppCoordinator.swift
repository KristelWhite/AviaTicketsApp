//
//  Coordinator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//


import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}


class AppCoordinator {

    static let shared = AppCoordinator()

    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []

    init() {
        self.tabBarController = UITabBarController()
    }
    func start() {
        setupTabBar()
      }

    private func setupTabBar() {
//        tabBarController.tabBar.layer.borderColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
//        tabBarController.tabBar.layer.borderWidth = 1
        tabBarController.tabBar.tintColor = Palette.darkBlue.color
        tabBarController.tabBar.unselectedItemTintColor = Palette.grey6.color
        tabBarController.tabBar.backgroundColor = Palette.black.color
        tabBarController.viewControllers = TabBarModel.allCases.map { createNavController(for: $0) }
    }

    private func createNavController(for tab: TabBarModel) -> UINavigationController {
            let vc = getCurrentViewController(tab: tab)
            let navController = UINavigationController(rootViewController: vc)
            let coordinator: Coordinator

            switch tab {
            case .avia:
                coordinator = AviaCoordinator(navigationController: navController, rootController: vc)
            case .profile, .hotels, .about, .subscriptions:
                coordinator = CommingSoonCoordinator(navigationController: navController, rootController: vc)
            }

            coordinator.start()
            childCoordinators.append(coordinator)

            navController.tabBarItem = UITabBarItem(
                title: tab.label,
                image: tab.image,
                selectedImage: tab.selectedImage
            )

            return navController
        }

    private func getCurrentViewController(tab: TabBarModel) -> UIViewController {
        switch tab {
        case .avia:
            let vc = MainViewController()
            let viewModel = MainViewModel()
            vc.viewModel = viewModel
            return vc
        case .profile, .hotels , .about, .subscriptions:
            return CommingSoonViewController()
        }
    }
}

    




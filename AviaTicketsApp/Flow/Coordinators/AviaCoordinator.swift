//
//  AviaCoordinator.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 31.05.2024.
//
import UIKit

class AviaCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainViewController()
        let viewModel = MainViewModel()
        viewModel.onEvent = { [weak self] event in
            switch event {
            case .enterCityFrom(let cityFrom):
                self?.showSearchController(with: cityFrom)
            }
        }
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }

    func showSearchController(with cityFrom: String) {
        let vc = SearchViewController()
        let viewModel = SearchViewModel()
//        viewModel.onEvent = { [weak self] event in
//            switch event {
//        }
        vc.viewModel = viewModel

        if #available(iOS 15.0, *) {
            vc.modalPresentationStyle = .pageSheet
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.large()]
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 16
            }
        } else {
            vc.modalPresentationStyle = .automatic
        }

        navigationController.present(vc, animated: true)
//        navigationController.pushViewController(vc, animated: false)
    }

}
class CommingSoonCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.pushViewController(CommingSoonViewController(), animated: false)
    }
}

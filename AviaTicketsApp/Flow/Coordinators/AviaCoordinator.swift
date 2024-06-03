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
        
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(vc, animated: false)
    }

    func showSearchController(with cityFrom: String) {
        let vc = SearchViewController()
        let viewModel = SearchViewModel(cityFrom: cityFrom)
        viewModel.onEvent = { [weak self] event in
            switch event {
            case .enterCityTo(let configureModel):
                self?.dismissController(vc: vc)
                self?.showRouteSuggestionsController(with: configureModel)
            }
        }
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
    }

    func dismissController(vc: UIViewController) {
        vc.dismiss(animated: true)
    }

        func showRouteSuggestionsController(with configureModel: MainModel) {
            let vc = RouteSuggestionsViewController()
            let viewModel = RouteSuggestionsViewModel(configureModel: configureModel)
//            viewModel.onEvent = { [weak self] event in
//                switch event {
//                case .enterCityTo(let city):
//                    <#code#>
//                }
            vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
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

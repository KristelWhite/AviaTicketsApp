//
//  RouteSuggestionsViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class RouteSuggestionsViewController: UIViewController{

    var viewModel: RouteSuggestionsViewModel?

    private let searchContainerView = RouteSearchContainerView()
    private var optionCollectionView: UICollectionView!
    private let tableContainerView = RouteTableContainerView()
//    private lazy var optionsDataSource = OptionsDataSource(collectionView: optionCollectionView)

    let showAllTicketsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посмотреть все билеты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        showAllTicketsButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        setupUI()

        viewModel?.onOutput = { [weak self] output in
            switch output {
            case .content(let flights):
                self?.tableContainerView.configure(with: flights)
            }

        }
        viewModel?.handle(.loadData)
    }

    func configureCollectionView(){
        optionCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        optionCollectionView.delegate = self
    }
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.headerMode = .none
            config.footerMode = .none
            return NSCollectionLayoutSection.list(using: config, layoutEnvironment: environment)
        }
        return layout
    }

    func setupUI() {
        view.backgroundColor = Palette.grey2.color

        view.addSubview(searchContainerView)
        view.addSubview(optionCollectionView)
        view.addSubview(tableContainerView)
        view.addSubview(showAllTicketsButton)

        searchContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(47)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(96)
        }

        optionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(33)
        }
        tableContainerView.snp.makeConstraints { make in
            make.top.equalTo(optionCollectionView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(249)
        }
        showAllTicketsButton.snp.makeConstraints { make in
            make.top.equalTo(tableContainerView.snp.bottom).offset(18)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(42)
        }
    }

        @objc func backButtonTapped() {
            print("Button tapped!")
        }
    }

extension RouteSuggestionsViewController: UICollectionViewDelegate  {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let item = optionsDataSource.getItem(at: indexPath) {
//            switch item {
//            case .backButton(let title):
//                print("Back button selected: \(title)")
//            case .date(let date):
//                print("Date selected: \(date)")
//            case .info(let info):
//                print("Info selected: \(info)")
//            }
//        }
//    }
}


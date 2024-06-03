//
//  RouteSuggestionsViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class RouteSuggestionsViewController: UIViewController{

    var viewModel: RouteSuggestionsViewModel?
    private lazy var optionsDataSource = OptionsDataSource(collectionView: optionCollectionView)

    private let searchContainerView = RouteSearchContainerView()
    private let tableContainerView = RouteTableContainerView()
    private let optionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    let showAllTicketsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посмотреть все билеты", for: .normal)
        button.setTitleColor(Palette.white.color, for: .normal)
        button.backgroundColor = Palette.priceBlue.color
        button.layer.cornerRadius = 8
        button.titleLabel?.font = Typography.italicButtonText.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setup()
    }


    private func setup(){
        configureCollectionView()
        configurevViewModel()
        addActions()
        addEvents()
        optionsDataSource.applyInitialSnapshot()

    }

    private func addEvents(){
        searchContainerView.onEvent = { [weak self] event in
            switch event {
            case .backButton:
                self?.viewModel?.handle(.backButtonTapped)
            }
        }
    }

    private func configurevViewModel() {
        viewModel?.onOutput = { [weak self] output in
            switch output {
            case .content(let flights):
                self?.tableContainerView.configure(with: flights)
            }

        }
        viewModel?.handle(.loadData)
    }

    private func addActions(){
        showAllTicketsButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    @objc func backButtonTapped() {
        print("Button tapped!")
    }

    private func configureCollectionView(){
        optionCollectionView.delegate = self
    }

    private func setupConstraints() {
        view.backgroundColor = Palette.black.color

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
}

extension RouteSuggestionsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let desiredWidth = {
            if let item = optionsDataSource.getItem(at: indexPath) {
                switch item {
                case .backButton(_, _):
                    return 105
                case .date(_, _):
                    return 88
                case .info(_, _):
                    return 104
                case .filter(_, _):
                    return 115
                }
            }
            return 105
        }()

        let height = 33
        return CGSize(width: desiredWidth, height: height)
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = optionsDataSource.getItem(at: indexPath) {
            switch item {
            case .backButton(let title):
                print("Back button selected: \(title)")
            case .date(let date):
                print("Date selected: \(date)")
            case .info(let info):
                print("Info selected: \(info)")
            case .filter(_, _):
                break
            }
        }
    }
}


//
//  SearchViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel?

    private let optionsStackView = OptionsStackView()
    private let searchContainerView = SearchContainerView()
    private let tableContainerView = PlaceTableContainerView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setEvents()
        setupUI()
        configureViewModel()
    }

    //  MARK: - private methods

    private func configureViewModel(){
        viewModel?.onOutput = { [weak self] output in
            switch output {
            case .content(let destinations):
                self?.tableContainerView.configure(with: destinations)
            case .setCityFrom(let city):
                self?.searchContainerView.setCityFrom(text: city)
            }
        }
        viewModel?.handle(.getCityFrom)
        viewModel?.handle(.loadData)

    }

    private func setEvents() {
        tableContainerView.onEvent = { [weak self] event in
            switch event {
            case .selectCity(let city):
                print("controller")
                self?.viewModel?.handle(.selectedCity(city))
            }
        }
        optionsStackView.onEvent = {[weak self] event in
            switch event {
            case .tapOn(let option):
                self?.viewModel?.handle(.tapOn(option))

            }
        }

        searchContainerView.onEvent = { [weak self] event in
            switch event {
            case .getCityTo(let city):
                self?.viewModel?.handle(.selectedCity(city))
            case .changeCityFrom(let city):
                self?.viewModel?.handle(.changeCityFrom(city))
            }

        }

    }

    private func setupUI() {
        view.backgroundColor = Palette.grey2.color

        view.addSubview(searchContainerView)
        view.addSubview(optionsStackView)
        view.addSubview(tableContainerView)

        searchContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(46)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(96)
        }

        optionsStackView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom).offset(26)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(90)
        }
        tableContainerView.snp.makeConstraints { make in
            make.top.equalTo(optionsStackView.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().priority(.low)
            make.height.equalTo(216)
            
        }
    }
}

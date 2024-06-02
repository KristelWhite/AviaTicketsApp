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

    private let tableContainerView: TableContainerView = {
        let view = TableContainerView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = Palette.grey3.color
        return view
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableContainerView.loadData()
    }

    func setupUI() {
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

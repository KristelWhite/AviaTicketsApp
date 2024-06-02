//
//  TableContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class TableContainerView: UIView {

    private lazy var destinationDataSource = DestinationDataSource(tableView: tableView)

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Palette.grey5.color
        tableView.separatorInset = UIEdgeInsets.zero

        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupConstraints()
    }

    func setup() {
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = Palette.grey3.color
    }

    func setupConstraints() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
        }
    }

    func loadData() {
        let destinations = [
            DestinationProps(id: UUID(), name: "Стамбул", description: "Популярное направление", image: Asset.tyrky.image),
            DestinationProps(id: UUID(), name: "Сочи", description: "Популярное направление", image: Asset.sochi.image),
            DestinationProps(id: UUID(), name: "Пхукет", description: "Популярное направление", image: Asset.phuket.image)
        ]

        destinationDataSource.applySnapshot(destinations: destinations)
    }
}

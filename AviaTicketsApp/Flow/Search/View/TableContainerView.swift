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
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(16)
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

//
//  TableContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class TableContainerView: UIView {

    enum Event {
        case selectCity(String)
    }

    var onEvent: ((Event) -> Void)?

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
        tableView.delegate = self
    }

    func setupConstraints() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
        }
    }

    func configure(with props: [DestinationProps]) {
        destinationDataSource.applySnapshot(destinations: props)
    }
}

extension TableContainerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("set select")
        guard let props = destinationDataSource.getItem(at: indexPath) else  { return }
        onEvent?(.selectCity(props.name))

    }
}

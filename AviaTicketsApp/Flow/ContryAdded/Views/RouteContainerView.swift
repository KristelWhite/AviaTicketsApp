//
//  RouteContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class RouteTableContainerView: UIView {

    enum Event {
        case selectRoute(String)
    }

    var onEvent: ((Event) -> Void)?

    private lazy var routeDataSource = RouteDataSource(tableView: tableView)

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Palette.grey5.color
        tableView.separatorInset = UIEdgeInsets.zero

        return tableView
    }()

    private let title: UILabel = {
        let label = UILabel()
        label.text = "Прямые рейсы"
        label.textColor = Palette.white.color
        label.font = Typography.title2.font
        return label
    }()

    //  MARK: - init

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

    //  MARK: - public

    func configure(with props: [RouteProps]) {
        routeDataSource.applySnapshot(routes: props)
    }

    //  MARK: - private

    private func setup() {
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = Palette.grey1.color
        tableView.delegate = self
    }

    private func setupConstraints() {
        self.addSubview(title)
        self.addSubview(tableView)

        title.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.top.equalTo(title.snp.bottom)
        }
    }
}

//  MARK: - UITableViewDelegate

extension RouteTableContainerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("set select")
        guard let props = routeDataSource.getItem(at: indexPath) else  { return }
        onEvent?(.selectRoute(props.name))
    }
}


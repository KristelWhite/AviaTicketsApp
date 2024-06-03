//
//  RouteDataSource.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class RouteDataSource {
    private var tableView: UITableView
    private var dataSource: UITableViewDiffableDataSource<Section, RouteProps>!

    init(tableView: UITableView) {
        self.tableView = tableView
        setup()
        configureDataSource()
    }

    private func setup() {
        let cellReuseIdentifier = RouteCell.reuseIdentifier
        tableView.register(RouteCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, RouteProps>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, route: RouteProps) -> UITableViewCell? in
            let cellReuseIdentifier = RouteCell.reuseIdentifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? RouteCell else {
                return nil
            }
            cell.configure(with: route)
            return cell
        }
    }

    func applySnapshot(routes: [RouteProps]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, RouteProps>()
        snapshot.appendSections([.main])
        snapshot.appendItems(routes, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func getItem(at indexPath: IndexPath) -> RouteProps? {
            return dataSource.itemIdentifier(for: indexPath)
        }

}

extension RouteDataSource {
    enum Section {
        case main
    }
}


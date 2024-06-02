//
//  SearchDataSource.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//
import UIKit

class DestinationDataSource {
    private var tableView: UITableView
    private var dataSource: UITableViewDiffableDataSource<Section, DestinationProps>!

    init(tableView: UITableView) {
        self.tableView = tableView
        setup()
        configureDataSource()
    }

    private func setup() {
        let cellReuseIdentifier = DestinationCell.reuseIdentifier
        tableView.register(DestinationCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, DestinationProps>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, destination: DestinationProps) -> UITableViewCell? in
            let cellReuseIdentifier = DestinationCell.reuseIdentifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? DestinationCell else {
                return nil
            }
            cell.configure(with: destination)
            return cell
        }
    }

    func applySnapshot(destinations: [DestinationProps]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, DestinationProps>()
        snapshot.appendSections([.main])
        snapshot.appendItems(destinations, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension DestinationDataSource {
    enum Section {
        case main
    }
}

//
//  OptionsDataSource.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class OptionsDataSource {
//    enum Item: Hashable {
//        case backButton(String)
//        case date(String)
//        case info(String)
//    }
//
//    private var collectionView: UICollectionView
//    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
//
//    init(collectionView: UICollectionView) {
//        self.collectionView = collectionView
//        setup()
//        configureDataSource()
//    }
//
//    private func setup() {
//        collectionView.register(ReturnTicketCell.self, forCellWithReuseIdentifier: ReturnTicketCell.reuseIdentifier)
//        collectionView.register(DateCell.self, forCellWithReuseIdentifier: DateCell.reuseIdentifier)
//        collectionView.register(InfoCell.self, forCellWithReuseIdentifier: InfoCell.reuseIdentifier)
//    }
//
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
//            (collectionView, indexPath, item) -> UICollectionViewCell? in
//            switch item {
//            case .backButton(let title):
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReturnTicketCell.reuseIdentifier, for: indexPath) as? ReturnTicketCell else { return}
//                cell.action = {
//                    print("Back button tapped: \(title)")
//                }
//                return cell
//
//            case .date(let date):
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell.reuseIdentifier, for: indexPath) as? DateCell else { return}
//                return cell
//
//            case .info(let info):
//                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCell.reuseIdentifier, for: indexPath) as? InfoCell else { return}
//                return cell
//            }
//        }
//    }
//
//    func applySnapshot(options: [Item]) {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(options, toSection: .main)
//        dataSource.apply(snapshot, animatingDifferences: true)
//    }
//
//    func applyInitialSnapshot() {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
//        snapshot.appendSections([.main])
//        snapshot.appendItems([
//            .backButton("back"),
//            .date("24 фев, сб"),
//            .info("1,эконом")
//        ])
//        dataSource.apply(snapshot, animatingDifferences: false)
//    }
//
//    func getItem(at indexPath: IndexPath) -> Item? {
//        return dataSource.itemIdentifier(for: indexPath)
//    }

}

extension OptionsDataSource {
    enum Section {
        case main
    }
}


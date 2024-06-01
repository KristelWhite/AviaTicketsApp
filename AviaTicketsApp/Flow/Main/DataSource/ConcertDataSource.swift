//
//  MainDataSource.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit

class ConcertDataSource {
    private var collectionView: UICollectionView
    private var dataSource: UICollectionViewDiffableDataSource<Section, Concert>!

    init(collectionView: UICollectionView) {
        print("initdatasource")
        self.collectionView = collectionView
        setup()
        configureDataSource()
    }

    private func setup() {
        let cellReuseIdentifier = ConcertCell.reuseIdentifier
        collectionView.register(ConcertCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Concert>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, concert: Concert) -> UICollectionViewCell? in
            let cellReuseIdentifier = ConcertCell.reuseIdentifier
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? ConcertCell else {
                return nil
            }
            cell.configure(with: concert)
            return cell
        }
        print("DataSource configured")
    }

    func applySnapshot(concerts: [Concert]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Concert>()
        snapshot.appendSections([.main])
        snapshot.appendItems(concerts, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
        print("Snapshot applied with concerts: \(concerts)")
    }
}

extension ConcertDataSource {
    enum Section {
        case main
    }
}

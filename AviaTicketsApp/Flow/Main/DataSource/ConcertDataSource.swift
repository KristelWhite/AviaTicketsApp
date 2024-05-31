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
        self.collectionView = collectionView
//        super.init()

        setup()
        configureDataSource()
    }

    private func setup() {
        let cellReuseIdentifier = String(describing: ConcertCell.self)
        collectionView.register(ConcertCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Concert>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, concert: Concert) -> UICollectionViewCell? in
            let cellReuseIdentifier = String(describing: ConcertCell.self)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? ConcertCell else {
                return nil
            }
//            cell.configure(with: concert)
            return cell
        }
    }

    func applySnapshot(concerts: [Concert]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Concert>()
        snapshot.appendSections([.main])
        snapshot.appendItems(concerts, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ConcertDataSource {
    enum Section {
        case main
    }
}

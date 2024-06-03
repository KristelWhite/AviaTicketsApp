//
//  OptionsDataSource.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class OptionsDataSource {

    enum Item: Hashable {
        case returnButton(UIImage, String) 
        case date(String, String)
        case info(UIImage, String)
        case filter(UIImage, String)
    }

    private var collectionView: UICollectionView
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        setup()
        configureDataSource()
    }

    //  MARK: - public
    
    func applySnapshot(options: [Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(options, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([
            .returnButton(Asset.plus.image, "обратно"),
            .date(Date().formattedDate(), Date().weekdayShortName()),
            .info(Asset.profileSmall.image, "1,эконом"),
            .filter(Asset.filters.image, "фильтр")
        ])
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func getItem(at indexPath: IndexPath) -> Item? {
        return dataSource.itemIdentifier(for: indexPath)
    }

    //  MARK: - private

    private func setup() {
        collectionView.register(OptionCell.self, forCellWithReuseIdentifier: OptionCell.reuseIdentifier)
        collectionView.register(DateCell.self, forCellWithReuseIdentifier: DateCell.reuseIdentifier)
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell in
            switch item {
            case .returnButton(let image, let title), .filter(let image, let title), .info(let image, let title):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionCell.reuseIdentifier, for: indexPath) as? OptionCell else { return UICollectionViewCell()}
                cell.configure(image: image, title: title)
                return cell
            case .date(let date, let day):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCell.reuseIdentifier, for: indexPath) as? DateCell else { return UICollectionViewCell()}
                cell.configure(date: date, day: day)
                return cell
            }
        }
    }
}

extension OptionsDataSource {
    enum Section {
        case main
    }
}


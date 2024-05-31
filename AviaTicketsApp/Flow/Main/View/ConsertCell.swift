//
//  MainCollectionViewCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit
import SnapKit

class ConcertCell: UICollectionViewCell {
    static let reuseIdentifier = "ConcertCell"

    private let imageView = UIImageView()
    private let artistLabel = UILabel()
    private let cityLabel = UILabel()
    private let priceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(artistLabel)
        contentView.addSubview(cityLabel)
        contentView.addSubview(priceLabel)

        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(contentView.snp.height).multipliedBy(0.6)
        }

        artistLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
        }

        cityLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(artistLabel.snp.bottom)
        }

        priceLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }

    func configure(with concert: Concert) {
        imageView.image = UIImage(named: concert.imageName)
        artistLabel.text = concert.artist
        cityLabel.text = concert.city
        priceLabel.text = concert.price
    }
}


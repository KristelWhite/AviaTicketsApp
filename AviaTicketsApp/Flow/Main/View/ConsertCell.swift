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

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.title3.font
        label.textColor = Palette.white.color
        return label
    }()
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.text2.font
        label.textColor = Palette.white.color
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.text2.font
        label.textColor = Palette.white.color
        return label
    }()
    private let planeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.avia.image
        imageView.tintColor = Palette.grey6.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let hStack: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .horizontal
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .center
        verticalStackView.spacing = 0
        return verticalStackView

    }()

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
        hStack.addArrangedSubview(planeImageView)
        hStack.addArrangedSubview(priceLabel)
        contentView.addSubview(hStack)

        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.width.equalTo(132)
        }

        artistLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(8)
        }

        cityLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(artistLabel.snp.bottom).offset(8)
        }

        hStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview()
        }
        planeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }

    func configure(with concert: ConcertProps) {
        imageView.image = concert.image
        artistLabel.text = concert.artist
        cityLabel.text = concert.city
        priceLabel.text = concert.price
        print("Configured cell with concert: \(concert)")
    }
}

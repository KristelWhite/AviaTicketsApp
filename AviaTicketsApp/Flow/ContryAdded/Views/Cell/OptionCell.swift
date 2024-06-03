//
//  ReturnTicketCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class OptionCell: UICollectionViewCell {

    static let reuseIdentifier = "optionCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Palette.white.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.title4.font
        label.textColor = Palette.white.color
        return label
    }()

    private let hStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 8
        return horizontalStackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage, title: String){
        imageView.image = image
        titleLabel.text = title
    }

    //MARK: - private metods

    private func setup() {
        contentView.backgroundColor = Palette.grey3.color
        contentView.layer.cornerRadius = 16
    }

    private func setupConstraints(){
        hStack.addArrangedSubview(imageView)
        hStack.addArrangedSubview(titleLabel)
        contentView.addSubview(hStack)

        hStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
    }
}

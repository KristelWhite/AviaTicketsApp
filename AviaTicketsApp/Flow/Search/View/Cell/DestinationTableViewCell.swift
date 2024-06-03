//
//  DestinationTableViewCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit
import SnapKit

class DestinationCell: UITableViewCell {
    static let reuseIdentifier = "DestinationCell"

    private let destinationImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.white.color
        label.font = Typography.title3.font
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.grey5.color
        label.font = Typography.text2.font
        return label
    }()
    private let vStack: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 4
        return verticalStackView

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupsConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.backgroundColor = UIColor.clear // Прозрачный фон для содержимого ячейки
        backgroundColor = UIColor.clear // Прозрачный фон самой ячейкиё
        selectionStyle = .none 
    }

    private func setupsConstraints() {
        contentView.addSubview(destinationImageView)
        contentView.addSubview(vStack)
        vStack.addArrangedSubview(nameLabel)
        vStack.addArrangedSubview(descriptionLabel)

        destinationImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.width.height.equalTo(40)
        }
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(destinationImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview().offset(4)
            make.trailing.equalToSuperview()
        }

    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: false)
//    }

    func configure(with destination: DestinationProps) {
        destinationImageView.image = destination.image
        nameLabel.text = destination.name
        descriptionLabel.text = destination.description
    }
}

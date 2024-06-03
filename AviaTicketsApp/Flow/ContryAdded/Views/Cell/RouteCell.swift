//
//  RouteTableViewCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//
import UIKit
import SnapKit

class RouteCell: UITableViewCell {
    static let reuseIdentifier = "RouteCell"

    private let colorView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    private let priceImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = Asset.acsessory.image
        imageView.tintColor = Palette.priceBlue.color
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.white.color
        label.font = Typography.title4.font
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.white.color
        label.font = Typography.text2.font
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.priceBlue.color
        label.font = Typography.title4.font
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
    private let hStack: UIStackView = {
        let hStackView = UIStackView()
        hStackView.axis = .horizontal
        hStackView.distribution = .equalSpacing
        hStackView.alignment = .fill
        return hStackView

    }()
    private let priceHStack: UIStackView = {
        let hStackView = UIStackView()
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.alignment = .fill
        hStackView.spacing = 0
        return hStackView

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
        contentView.addSubview(colorView)
        contentView.addSubview(vStack)
        priceHStack.addArrangedSubview(priceLabel)
        priceHStack.addArrangedSubview(priceImageView)
        hStack.addArrangedSubview(nameLabel)
        hStack.addArrangedSubview(priceHStack)
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(timeLabel)

        colorView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(24)
            make.width.height.equalTo(24)
        }
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(colorView.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview()
        }

    }

    func configure(with route: RouteProps) {
        colorView.backgroundColor = route.color
        nameLabel.text = route.name
        timeLabel.text = route.time
        priceLabel.text = route.price
    }
}

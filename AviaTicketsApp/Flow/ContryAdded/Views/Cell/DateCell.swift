//
//  DateCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class DateCell: UICollectionViewCell {

    static let reuseIdentifier = "dateCell"

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.title4.font
        label.textColor = Palette.white.color
        return label
    }()

    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.title4.font
        label.textColor = Palette.grey5.color
        return label
    }()

    private let hStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 0
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

    func configure(date: String, day: String){
        dateLabel.text = date
        dayLabel.text = day
    }

    //MARK: - private metods

    private func setup() {
        contentView.backgroundColor = Palette.grey3.color
        contentView.layer.cornerRadius = 16
    }

    private func setupConstraints(){
        hStack.addArrangedSubview(dateLabel)
        hStack.addArrangedSubview(dayLabel)
        contentView.addSubview(hStack)

        hStack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}


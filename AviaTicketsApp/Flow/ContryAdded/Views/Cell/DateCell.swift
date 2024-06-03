//
//  DateCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class DateCell: UICollectionViewCell {
    static let reuseIdentifier = "dateCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        label.text = "24 фев, сб"
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ReturnTicketCell.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class ReturnTicketCell: UICollectionViewCell {
    static let reuseIdentifier = "returnButtonCell"

    var action: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let button = UIButton(type: .system)
        button.setTitle("+ обратно", for: .normal)
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
    }

    @objc func returnButtonTapped() {
        action?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

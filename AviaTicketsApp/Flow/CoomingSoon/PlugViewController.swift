//
//  PlugViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 03.06.2024.
//

import UIKit

class PlugViewController: UIViewController {

    enum Event {
        case backButton
    }

    var onEvent: ((Event) -> Void)?

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.commingsoon.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Контент в разработке"
        label.font = Typography.title1.font
        label.textAlignment = .center
        label.textColor = Palette.white.color
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = Palette.black.color.withAlphaComponent(0.98)
    }

    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(label)

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }
    

}

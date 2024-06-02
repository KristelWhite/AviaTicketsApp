//
//  SearchContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class SearchContainerView: UIView {

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = Palette.grey3.color
        Shadow.base.apply(to: self)
        layer.cornerRadius = 16

        let vStack: UIStackView = {
            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.distribution = .equalSpacing
            verticalStackView.alignment = .fill
            verticalStackView.spacing = 8
            return verticalStackView
        }()
        let separaterView: UIView = {
            let view = UIView()
            view.backgroundColor = Palette.grey4.color
            return view
        }()
        addSubview(vStack)
        addTextFieldWithImageView(to: vStack, text: "", placeholder: "Куда - Турция", image: Asset.plane.image, imageColor: Palette.grey6.color)
        vStack.addArrangedSubview(separaterView)
        addTextFieldWithImageView(to: vStack, text: nil, placeholder: "Откуда - Москва", image: Asset.search.image, imageColor: Palette.grey7.color)

        vStack.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(16)
        }

        separaterView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }

    private func addTextFieldWithImageView(to superView: UIStackView, text: String?, placeholder: String, image: UIImage, imageColor: UIColor){
        let textField: UITextField = {
            let textField = UITextField()
            let placeholderText = placeholder
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: Palette.grey6.color, .font: Typography.buttonText.font
            ]
            textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
            textField.borderStyle = .none
            textField.backgroundColor = .clear
            textField.textColor = Palette.white.color
            textField.font = Typography.buttonText.font
            if let text = text {
                textField.text = text
            }
            return textField
        }()
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.tintColor = imageColor
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()

        let hStack: UIStackView = {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution = .fill
            horizontalStackView.alignment = .fill
            horizontalStackView.spacing = 16
            return horizontalStackView
        }()

        hStack.addArrangedSubview(imageView)
        hStack.addArrangedSubview(textField)
        superView.addArrangedSubview(hStack)

        imageView.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
    }
}
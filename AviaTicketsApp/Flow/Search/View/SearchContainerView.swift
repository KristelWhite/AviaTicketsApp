//
//  SearchContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class SearchContainerView: UIView {

    var cityFromTextField = UITextField()
    var cityToTextField = UITextField()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setupView(){
        backgroundColor = Palette.grey3.color
        Shadow.base.apply(to: self)
        layer.cornerRadius = 16
    }
    private func setup() {
        cityFromTextField.delegate = self
        setupView()
        addSubviews()

    }

    func setCityFrom(text: String) {
        self.cityFromTextField.text = text
    }

    func setCityTo(text: String) {
        self.cityToTextField.text = text
    }

    private func addSubviews() {
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
        addTextFieldWithImageView(to: vStack, textField: cityFromTextField,text: nil, placeholder: "Куда - Турция", image: Asset.plane.image, imageColor: Palette.grey6.color)
        vStack.addArrangedSubview(separaterView)
        addTextFieldWithImageView(to: vStack, textField: cityToTextField,text: nil, placeholder: "Откуда - Москва", image: Asset.search.image, imageColor: Palette.grey7.color)

        vStack.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(16)
        }

        separaterView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }

    private func addTextFieldWithImageView(to superView: UIStackView, textField: UITextField, text: String?, placeholder: String, image: UIImage, imageColor: UIColor){
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

extension SearchContainerView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
            // Проверяем, содержит ли текстовое поле текст
            if let text = textField.text, !text.isEmpty {
                print("Текстовое поле заполнено: \(text)")
                // Здесь может быть ваш код, который реагирует на окончание ввода, например:
                // Отправка данных на сервер, обновление интерфейса и т.д.
            } else {
                print("Текстовое поле пустое или текст был удален")
            }
        }

}

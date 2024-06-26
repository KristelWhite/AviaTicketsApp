//
//  SearchContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class SearchContainerView: UIView {

    enum Event {
        case getCityTo(String)
        case changeCityFrom(String)
    }
    var onEvent: ((Event) -> Void)?

    private var cityFromTextField = UITextField()
    private var cityToTextField = UITextField()

    private let clearCityToButton: UIButton = {
        let clearButton = UIButton(type: .custom)
        clearButton.setTitleColor(Palette.grey6.color, for: .normal)
        clearButton.setImage(Asset.cansel.image, for: .normal)
        return clearButton
    }()

    private let clearCityFromButton: UIButton = {
        let clearButton = UIButton(type: .custom)
        clearButton.setTitleColor(Palette.grey6.color, for: .normal)
        clearButton.setImage(Asset.cansel.image, for: .normal)
        return clearButton
    }()

    //  MARK: - init
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    //  MARK: - public methods

    func setCityFrom(text: String) {
        self.cityFromTextField.text = text
    }

    func setCityTo(text: String) {
        self.cityToTextField.text = text
    }

    //  MARK: - private methods

    private func setupView(){
        backgroundColor = Palette.grey3.color
        Shadow.base.apply(to: self)
        layer.cornerRadius = 16
    }

    private func setup() {
        cityToTextField.delegate = self
        cityFromTextField.delegate = self
        setupView()
        addSubviews()
        addActions()
    }

    private func addActions(){
        clearCityToButton.addTarget(self, action: #selector(clearCityToTextField), for: .touchUpInside)
        cityToTextField.rightView = clearCityToButton
        cityToTextField.rightViewMode = .always

        clearCityFromButton.addTarget(self, action: #selector(clearCityFromTextField), for: .touchUpInside)
        cityFromTextField.rightView = clearCityFromButton
        cityFromTextField.rightViewMode = .whileEditing

        cityFromTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        cityToTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        textField.text = textField.text?.filter { "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя- ".contains($0) }
    }

    @objc func clearCityToTextField() {
        cityToTextField.text = ""
    }

    @objc func clearCityFromTextField() {
        cityFromTextField.text = ""
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

//  MARK: - UITextFieldDelegate

extension SearchContainerView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == cityToTextField {
            if let text = textField.text, !text.isEmpty {
                onEvent?(.getCityTo(text))
            }
        } else if  textField == cityFromTextField {
            if let text = textField.text, !text.isEmpty {
                onEvent?(.changeCityFrom(text))
            }
        }
        textField.resignFirstResponder()
           return true
       }
}

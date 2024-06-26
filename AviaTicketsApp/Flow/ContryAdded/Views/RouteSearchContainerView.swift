//
//  SearchContainerView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit
import SnapKit

class RouteSearchContainerView: UIView {

    enum Event {
        case backButton
    }

    var onEvent: ((Event) -> Void)?

    private var cityFromTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Куда - Турция"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Palette.grey6.color, .font: Typography.buttonText.font
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = Palette.white.color
        textField.font = Typography.buttonText.font
        return textField
    }()

    private var cityToTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = "Откуда - Москва"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Palette.grey6.color, .font: Typography.buttonText.font
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = Palette.white.color
        textField.font = Typography.buttonText.font
        return textField
    }()

    let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = Palette.white.color
        button.setImage(Asset.back.image, for: .normal)
        return button
    }()

    let exchangeButton: UIButton = {
        let button = UIButton()
        button.tintColor = Palette.white.color
        button.setImage(Asset.swap.image, for: .normal)
        return button
    }()

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

    //    MARK: - init

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()

    }

    //    MARK: - public

    func setCityFrom(text: String) {
        self.cityFromTextField.text = text
    }

    func setCityTo(text: String) {
        self.cityToTextField.text = text
    }

    //    MARK: - private

    private func setup() {
        setupView()
        addSubviews()
        addActions()
    }

    private func addActions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        exchangeButton.addTarget(self, action: #selector(exchangeButtonTapped), for: .touchUpInside)
        clearCityToButton.addTarget(self, action: #selector(clearCityToTextField), for: .touchUpInside)
        cityToTextField.rightView = clearCityToButton
        cityToTextField.rightViewMode = .always

        clearCityFromButton.addTarget(self, action: #selector(clearCityFromTextField), for: .touchUpInside)
        cityFromTextField.rightView = clearCityFromButton
        cityFromTextField.rightViewMode = .whileEditing

        cityFromTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        cityToTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    //  MARK: - Action

    @objc func backButtonTapped() {
        onEvent?(.backButton)
    }

    @objc func exchangeButtonTapped() {
        let temp = cityToTextField.text
        cityToTextField.text = cityFromTextField.text
        cityFromTextField.text = temp
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

    private func setupView(){
        backgroundColor = Palette.grey3.color
        Shadow.base.apply(to: self)
        layer.cornerRadius = 16
    }

    private func addSubviews() {
        let hStack: UIStackView = {
            let hStackView = UIStackView()
            hStackView.axis = .horizontal
            hStackView.distribution = .fill
            hStackView.alignment = .center
            hStackView.spacing = 8
            return hStackView
        }()
        addSubview(hStack)
        hStack.addArrangedSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        hStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        addVStackSubviews(to: hStack)
    }

    private func addVStackSubviews(to superView: UIStackView) {
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

        superView.addArrangedSubview(vStack)
        addTextFieldWithButton(to: vStack)
        vStack.addArrangedSubview(separaterView)
        vStack.addArrangedSubview(cityToTextField)

        separaterView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }

    private func addTextFieldWithButton(to superView: UIStackView){
        let hStack: UIStackView = {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution = .fill
            horizontalStackView.alignment = .fill
            horizontalStackView.spacing = 16
            return horizontalStackView
        }()

        hStack.addArrangedSubview(cityFromTextField)
        hStack.addArrangedSubview(exchangeButton)
        superView.addArrangedSubview(hStack)

        exchangeButton.snp.makeConstraints { make in
            make.width.equalTo(24)
        }
    }
}





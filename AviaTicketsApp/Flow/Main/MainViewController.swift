//
//  MainViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit
import SnapKit
import Combine

class MainViewController: UIViewController {

    var viewModel: MainViewModel?
    private lazy var concertDataSource = ConcertDataSource(collectionView: collectionView)

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск дешевых\nавиабилетов"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = Typography.title1.font
        label.textColor = Palette.grey7.color
        Shadow.base.apply(to: label)
        return label
    }()

    private let innerSearchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.grey4.color
        Shadow.base.apply(to: view)
        view.layer.cornerRadius = 16
        return view
    }()

    private let outerSearchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.grey3.color
        view.layer.cornerRadius = 16
        return view
    }()

    private let separaterView: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.grey6.color
        return view
    }()

    private let cityFromTextField: UITextField = {
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

    private let cityToTextField: UITextField = {
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

    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.search.image
        imageView.tintColor = Palette.grey7.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Музыкально отлететь"
        label.font = Typography.title1.font
        label.textColor = Palette.white.color
        return label
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 132, height: 213)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private let hStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 16
        return horizontalStackView
    }()

    private let vStack: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 8
        return verticalStackView

    }()

    private let clearButton: UIButton = {
        let clearButton = UIButton(type: .custom)
        clearButton.setTitleColor(Palette.grey6.color, for: .normal)
        clearButton.setImage(Asset.cansel.image, for: .normal)
        return clearButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Palette.black.color

        setupUI()
        viewModel?.onOutput = { [weak self] output in
            switch output {
            case .content(let concerts):
                self?.concertDataSource.applySnapshot(concerts: concerts)
            case .setCityFrom(let city):
                self?.cityFromTextField.text = city
            }
        }
        viewModel?.handle(.loadData)
        viewModel?.handle(.setCityFrom)

        addActions()
    }

    private func addActions() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped))
        cityToTextField.isUserInteractionEnabled = true
        cityToTextField.addGestureRecognizer(tapGesture)

        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        cityFromTextField.rightView = clearButton
        cityFromTextField.rightViewMode = .whileEditing

        cityFromTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        textField.text = textField.text?.filter { "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя- ".contains($0) }
    }

    @objc func clearTextField() {
        cityFromTextField.text = ""
       }

    @objc func textFieldTapped() {
        viewModel?.handle(.enterCityFrom(cityFromTextField.text ?? ""))
        cityToTextField.becomeFirstResponder()
        }

    private func setupUI() {
        vStack.addArrangedSubview(cityFromTextField)
        vStack.addArrangedSubview(separaterView)
        vStack.addArrangedSubview(cityToTextField)
        hStack.addArrangedSubview(searchImageView)
        hStack.addArrangedSubview(vStack)
        innerSearchContainerView.addSubview(hStack)
        outerSearchContainerView.addSubview(innerSearchContainerView)
        view.addSubview(outerSearchContainerView)

        view.addSubview(titleLabel)
        view.addSubview(secondTitleLabel)
        view.addSubview(collectionView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(28)
            make.centerX.equalToSuperview()
        }

        outerSearchContainerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(122)
        }

        innerSearchContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(16)
        }

        hStack.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(8)
        }

        separaterView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        searchImageView.snp.makeConstraints { make in
            make.width.equalTo(24)
        }

        secondTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(outerSearchContainerView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(secondTitleLabel.snp.bottom).offset(26)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.height.equalTo(213)
        }
    }
}

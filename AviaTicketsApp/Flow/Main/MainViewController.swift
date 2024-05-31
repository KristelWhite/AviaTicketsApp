//
//  MainViewController.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    var viewModel: MainViewModel?
    private lazy var concertDataSource = ConcertDataSource(collectionView: collectionView)

    private let searchContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .darkGray
            view.layer.cornerRadius = 10
            return view
        }()

        private let cityFromTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Минск"
            textField.borderStyle = .none
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 5
            textField.setLeftPaddingPoints(10)
            return textField
        }()

        private let cityToTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Куда - Турция"
            textField.borderStyle = .none
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 5
            textField.setLeftPaddingPoints(10)
            return textField
        }()

        private let searchImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "magnifyingglass")
            imageView.tintColor = .white
            return imageView
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Музыкально отлететь"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .white
            return label
        }()

        private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
//            collectionView.register(ConcertCell.self, forCellWithReuseIdentifier: ConcertCell.reuseIdentifier)
            return collectionView
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .black

            setupUI()
        }

        private func setupUI() {
            view.addSubview(searchContainerView)
            searchContainerView.addSubview(cityFromTextField)
            searchContainerView.addSubview(cityToTextField)
            searchContainerView.addSubview(searchImageView)
            view.addSubview(titleLabel)
            view.addSubview(collectionView)

            searchContainerView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                make.leading.trailing.equalToSuperview().inset(20)
                make.height.equalTo(100)
            }

            cityFromTextField.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.leading.trailing.equalToSuperview().inset(10)
                make.height.equalTo(40)
            }

            cityToTextField.snp.makeConstraints { make in
                make.top.equalTo(cityFromTextField.snp.bottom).offset(10)
                make.leading.trailing.equalToSuperview().inset(10)
                make.height.equalTo(40)
            }

            searchImageView.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(15)
                make.centerY.equalTo(cityToTextField)
                make.width.height.equalTo(25)
            }

            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(searchContainerView.snp.bottom).offset(20)
                make.leading.equalToSuperview().inset(20)
            }

            collectionView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(200)
            }
        }



//        private func loadData() {
//            let concerts = viewModel.getConcerts()
//            concertDataSource.applySnapshot(concerts: concerts)
//        }
    }

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

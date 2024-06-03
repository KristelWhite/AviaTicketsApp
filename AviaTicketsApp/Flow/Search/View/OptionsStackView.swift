//
//  OptionsStackView.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import UIKit

class OptionsStackView: UIView {

    enum Event {
        case tapOn(Options)
    }
    var onEvent: ((Event) -> Void)?

    enum Options: CaseIterable {
        case route
        case anyDirection
        case onWeekend
        case lastMinuteTickets

        var text: String {
            switch self {
            case .route:
                return "Сложный маршрут"
            case .anyDirection:
                return "Куда угодно"
            case .onWeekend:
                return "Выходные"
            case .lastMinuteTickets:
                return "Горячие билеты"
            }
        }
        var color: UIColor {
            switch self {
            case .route:
                return Palette.green.color
            case .anyDirection:
                return Palette.blue.color
            case .onWeekend:
                return Palette.darkBlue.color
            case .lastMinuteTickets:
                return Palette.red.color
            }
        }
        var image: UIImage {
            switch self {
            case .route:
                return Asset.vector.image
            case .anyDirection:
                return Asset.network.image
            case .onWeekend:
                return Asset.calendar.image
            case .lastMinuteTickets:
                return Asset.fire.image
            }
        }
        var action: () -> Void {
            switch self {
            case .route:
                return {}
            case .anyDirection:
                return {}
            case .onWeekend:
                return {}
            case .lastMinuteTickets:
                return {}
            }
        }
    }

    private let stackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .top
        horizontalStackView.spacing = 16
        return horizontalStackView
    }()

    //  MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    //  MARK: - private methods

    private func setupView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        addOptionStack()
    }

    private func addOptionStack() {
        Options.allCases.forEach { option in
            addOption(option)
        }
    }

    private func addOption(_ option: Options) {
        let stack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 8
            stack.distribution = .fill
            stack.alignment = .center
            return stack
        }()

        let optionView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 8
            return view
        }()

        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = Palette.white.color
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()

        let label: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.textColor = Palette.white.color
            label.textAlignment = .center
            label.font = Typography.text2.font
            return label
        }()

        stack.addArrangedSubview(optionView)
        optionView.addSubview(imageView)
        stack.addArrangedSubview(label)
        stackView.addArrangedSubview(stack)

        optionView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }

        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        label.text = option.text
        imageView.image = option.image
        optionView.backgroundColor = option.color

        addAction(on: stack, with: option)
    }

    private func addAction(on stack: UIStackView, with option: Options){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(optionTapped(_:)))
        stack.addGestureRecognizer(tapGesture)
        stack.tag = option.hashValue
    }

    @objc private func optionTapped(_ sender: UITapGestureRecognizer) {
        guard let viewTag = sender.view?.tag,
              let option = Options.allCases.first(where: { $0.hashValue == viewTag }) else { return }
        print(option.text)
        onEvent?(.tapOn(option))
    }
}

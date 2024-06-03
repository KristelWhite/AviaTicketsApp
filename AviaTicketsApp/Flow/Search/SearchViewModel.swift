//
//  SearchViewModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import Foundation
import Combine

class SearchViewModel {

    enum Output {
        case content([DestinationProps])
        case setCityFrom(String)
    }

    enum Input {
        case loadData
        case selectedCity(String)
        case getCityFrom
        case tapOn(OptionsStackView.Options)
        case changeCityFrom(String)
    }

    enum Event {
        case enterCityTo(FlightModel)
        case openCommingSoon
    }

    var onOutput: ((Output) -> Void)?
    var onEvent: ((Event) -> Void)?

    private let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()

    private var flightSearchModel: FlightModel!

    init(cityFrom: String) {
        updateSearch(cityFrom: cityFrom, cityTo: nil)
    }
    // MARK: - public methods

    func handle(_ input: Input) {
        switch input {
        case .loadData:
            loadData()
        case .selectedCity(let cityTo):
            update(cityTo: cityTo)
            onEvent?(.enterCityTo(flightSearchModel))
        case .getCityFrom:
            onOutput?(.setCityFrom(flightSearchModel.cityFrom ?? ""))
        case .tapOn(let option):
            switch option {
            case .route:
                onEvent?(.openCommingSoon)
            case .anyDirection:
                onEvent?(.openCommingSoon)
            case .onWeekend:
                onEvent?(.openCommingSoon)
            case .lastMinuteTickets:
                onEvent?(.openCommingSoon)
            }
        case .changeCityFrom(let city):
            update(cityFrom: city)
        }
    }

    // MARK: - Networking

    private func loadData() {
        let destinations = [
            DestinationProps(id: UUID(), name: "Стамбул", description: "Популярное направление", image: Asset.tyrky.image),
            DestinationProps(id: UUID(), name: "Сочи", description: "Популярное направление", image: Asset.sochi.image),
            DestinationProps(id: UUID(), name: "Пхукет", description: "Популярное направление", image: Asset.phuket.image)
        ]
        
        onOutput?(.content(destinations))
    }

    private func updateSearch(cityFrom: String?, cityTo: String?) {
        self.flightSearchModel = FlightModel(cityFrom: cityFrom, cityTo: cityTo)
    }

    private func update(cityFrom: String?) {
        self.flightSearchModel.cityFrom = cityFrom
    }
    private func update(cityTo: String?) {
        self.flightSearchModel.cityTo = cityTo
    }
}


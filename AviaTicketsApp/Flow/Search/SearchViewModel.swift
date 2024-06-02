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
        case tapSelectedCity(String)
        case getCityFrom
    }

    enum Event {
        case enterCityTo(String)
    }

    var onOutput: ((Output) -> Void)?
    var onEvent: ((Event) -> Void)?

    let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()
    //
    private var flightSearchModel: MainModel?

    var cityFrom: String
    var cityTo: String? {
        return flightSearchModel?.cityTo
    }
    //

    init(cityFrom: String) {
        self.cityFrom = cityFrom
    }

    func handle(_ input: Input) {
        switch input {
        case .loadData:
            loadData()
        case .tapSelectedCity(let city):
            print("vm")
            onEvent?(.enterCityTo(city))
        case .getCityFrom:
            onOutput?(.setCityFrom(cityFrom))
        }
    }


    private func loadData() {
        let destinations = [
            DestinationProps(id: UUID(), name: "Стамбул", description: "Популярное направление", image: Asset.tyrky.image),
            DestinationProps(id: UUID(), name: "Сочи", description: "Популярное направление", image: Asset.sochi.image),
            DestinationProps(id: UUID(), name: "Пхукет", description: "Популярное направление", image: Asset.phuket.image)
        ]
        
        onOutput?(.content(destinations))
    }

    func updateSearch(cityFrom: String, cityTo: String) {
        self.flightSearchModel = MainModel(cityFrom: cityFrom, cityTo: cityTo)
    }
//
}


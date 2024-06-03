//
//  RouteSuggestionsViewModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 02.06.2024.
//

import Foundation
import Combine

class RouteSuggestionsViewModel {
    enum Output {
        case content([RouteProps])

    }

    enum Input {
        case loadData
        case allTicketsButtonTapped
        case backButtonTapped
    }

    enum Event {
        case showAllTickets
        case close
    }

    var onOutput: ((Output) -> Void)?
    var onEvent: ((Event) -> Void)?

    let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()

    private var flightSearchModel: MainModel!
    
    init(configureModel: MainModel) {
        updateSearch(cityFrom: configureModel.cityFrom, cityTo: configureModel.cityTo)
    }

    private func updateSearch(cityFrom: String?, cityTo: String?) {
        self.flightSearchModel = MainModel(cityFrom: cityFrom, cityTo: cityTo)
    }

    func handle(_ input: Input) {
        switch input {
        case .loadData:
            loadData()
        case .allTicketsButtonTapped:
            onEvent?(.showAllTickets)
        case .backButtonTapped:
            onEvent?(.close)
        }
    }

    private func loadData() {
        service.fetchFlights()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.handleReceivedData(data: data)
                print("Получены данные второго API: \(data)")
            })
            .store(in: &cancellables)
    }

    private func handleReceivedData(data: FligthListResponse) {
        let content = data.ticketsOffers.map {
            RouteProps(id: $0.id, name: $0.title, time: $0.timeRange.joined(separator: " "), price: $0.price.formattedValue, color: FligthColor.getColor(for: $0.id))
        }
        onOutput?(.content(content))
    }
}

//
//  MainViewModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import Foundation
import Combine

class MainViewModel {

    enum Output {
        case content([ConcertProps])
        case setCityFrom(String)
    }

    enum Input {
        case loadData
        case enterCityFrom(String)
        case setCityFrom
    }

    enum Event {
        case enterCityFrom(String)
    }

    var onOutput: ((Output) -> Void)?
    var onEvent: ((Event) -> Void)?

    private let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()
    private let defaults = UserDefaults.standard

    private var flightSearchModel: FlightModel?

    func handle(_ input: Input) {
        switch input {
        case .loadData:
            loadData()
        case .enterCityFrom(let city):
            onEvent?(.enterCityFrom(city))
            safeInUserDefaults(value: city)
        case .setCityFrom:
            onOutput?(.setCityFrom(getFromUserDefaults()))
        }
    }

    //   MARK: - private methods

    private func updateSearch(cityFrom: String, cityTo: String) {
        self.flightSearchModel = FlightModel(cityFrom: cityFrom, cityTo: cityTo)
    }

    //    MARK: - UserDefaults

    private func safeInUserDefaults(value: String){
        defaults.set(value, forKey: "cityFrom")
    }

    private func getFromUserDefaults() -> String {
        if let city = UserDefaults.standard.string(forKey: "cityFrom") {
            return city
        } else {
            return ""
        }
    }

//    MARK: - Networking

    private func loadData() {
        service.fetchConcerts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.handleReceivedData(data: data)
                print("Получены данные первого API: \(data)")
            })
            .store(in: &cancellables)
    }

    private func handleReceivedData(data: ConcertListResponse) {
        let content = data.offers.map {
            ConcertProps.init(artist: $0.title, city: $0.town, price: $0.price.formattedValue, image: ConcertImage.getImage(for: $0.id))
        }
        onOutput?(.content(content))
    }
}

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
        case content([Concert])
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

    let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()
    private let defaults = UserDefaults.standard
    //
    private var flightSearchModel: FlightModel?
    var cityFrom: String? {
        return flightSearchModel?.cityFrom
    }
    var cityTo: String? {
        return flightSearchModel?.cityTo
    }
    //

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
    func safeInUserDefaults(value: String){
        defaults.set(value, forKey: "cityFrom")
    }

    func getFromUserDefaults() -> String {
        if let city = UserDefaults.standard.string(forKey: "cityFrom") {
            return city
        } else {
            return ""
        }
    }


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
//        let concerts = [Concert( artist: "artist", city: "city", price: "price", imageName: "nrjhn")]
    }

    private func handleReceivedData(data: ConcertListResponse) {
        let content = data.offers.map {
            Concert.init(artist: $0.title, city: $0.town, price: $0.price.formattedValue, image: ConcertImage.getImage(for: $0.id))
        }
        onOutput?(.content(content))
    }
//
    func updateSearch(cityFrom: String, cityTo: String) {
        self.flightSearchModel = FlightModel(cityFrom: cityFrom, cityTo: cityTo)
    }
//
}

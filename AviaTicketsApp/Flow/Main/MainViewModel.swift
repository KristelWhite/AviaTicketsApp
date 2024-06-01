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
    }

    enum Input {
        case loadData
    }

    var onOutput: ((Output) -> Void)?

    let service = RequestManager()
    private var cancellables = Set<AnyCancellable>()
    //
    private var flightSearchModel: MainModel?
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
        self.flightSearchModel = MainModel(cityFrom: cityFrom, cityTo: cityTo)
    }
//
}

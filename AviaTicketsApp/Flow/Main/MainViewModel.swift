//
//  MainViewModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import Foundation

class MainViewModel {
    private var flightSearchModel: MainModel?

    var cityFrom: String? {
        return flightSearchModel?.cityFrom
    }

    var cityTo: String? {
        return flightSearchModel?.cityTo
    }

    func updateSearch(cityFrom: String, cityTo: String) {
        self.flightSearchModel = MainModel(cityFrom: cityFrom, cityTo: cityTo)
    }
}

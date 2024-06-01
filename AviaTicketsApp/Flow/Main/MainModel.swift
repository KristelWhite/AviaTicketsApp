//
//  MainModel.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 30.05.2024.
//

import Foundation

struct MainModel {
    let cityFrom: String
    let cityTo: String
}

struct Concert: Hashable { 
    let artist: String
    let city: String
    let price: String
    let imageName: String
}

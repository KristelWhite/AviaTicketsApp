//
//  APIService.swift
//  AviaTicketsApp
//
//  Created by Кристина Пастухова on 01.06.2024.
//

import Foundation
import Combine

struct APIConfig {
    static let baseURL = URL(string: "https://run.mocky.io/v3/")!

    enum Endpoint: String {
        case concerts = "214a1713-bac0-4853-907c-a1dfc3cd05fd"
        case flight = "7e55bf02-89ff-4847-9eb7-7d83ef884017"
        case tickets = "670c3d56-7f03-4237-9e34-d437a9e56ebf"
    }
}

 class APIService {
    static let shared = APIService()
    private var cancellables = Set<AnyCancellable>()

    private func url(for endpoint: APIConfig.Endpoint) -> URL {
        return APIConfig.baseURL.appendingPathComponent(endpoint.rawValue)
    }

    fileprivate func fetch<T: Decodable>(from endpoint: APIConfig.Endpoint) -> AnyPublisher<T, Error> {
        let url = self.url(for: endpoint)

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

// MARK: - Abstract Request Class

//class AbstractRequest {
//    func fetch<T: Decodable>(endpoint: APIConfig.Endpoint) -> AnyPublisher<T, Error> {
//        return APIService.shared.fetch(from: endpoint)
//    }
//}

protocol RequestManagerAbstract: AnyObject {
    func fetchConcerts() -> AnyPublisher<ConcertListResponse, Error>
    func fetchFlights() -> AnyPublisher<FligthListResponse, Error>
    func fetchTickets() -> AnyPublisher<TicketListResponce, Error>

}

// MARK: - Specific Requests

final class RequestManager: APIService, RequestManagerAbstract  {
    func fetchConcerts() -> AnyPublisher<ConcertListResponse, Error> {
        return fetch(from: .concerts)
    }

    func fetchFlights() -> AnyPublisher<FligthListResponse, Error> {
        return fetch(from: .flight)
    }

    func fetchTickets() -> AnyPublisher<TicketListResponce, Error> {
        return fetch(from: .tickets)
    }
}


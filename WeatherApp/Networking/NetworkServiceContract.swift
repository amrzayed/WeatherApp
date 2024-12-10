//
//  NetworkServiceContract.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Foundation
import Combine

protocol NetworkServiceContract {
    func request<T: Decodable>(
        endpoint: String,
        method: String,
        headers: [String: String]?,
        body: Data?,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError>
}


class NetworkService: NetworkServiceContract {
    static let shared = NetworkService()
    func request<T: Decodable>(
        endpoint: String,
        method: String = "GET",
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: endpoint) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.unknownError
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return data
                    print("data is ", data)
                } else {
                    throw NetworkError.serverError(httpResponse.statusCode)
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let decodingError = error as? DecodingError {
                    return NetworkError.decodingError(decodingError)
                } else if let networkError = error as? NetworkError {
                    return networkError
                }
                return NetworkError.unknownError
            }
            .eraseToAnyPublisher()
    }
}

//
//  HomeUseCase.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Combine

protocol FetchHomeUseCaseContract {
    func execute(city name: String) -> AnyPublisher<WeatherModel, NetworkError>
}

class FetcHomeUseCase: FetchHomeUseCaseContract {
    private let repository: HomeRepositoryContract

    init(repository: HomeRepositoryContract = HomeRepositoryImpl()) {
        self.repository = repository
    }

    func execute(city name: String) -> AnyPublisher<WeatherModel, NetworkError> {
        repository.fetchCityWeather(city: name)
    }
}

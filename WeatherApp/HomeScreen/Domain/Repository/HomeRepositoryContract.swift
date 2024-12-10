//
//  HomeRepositoryContract.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Combine

protocol HomeRepositoryContract{
    func fetchCityWeather(city name: String) -> AnyPublisher<WeatherModel, NetworkError>
}

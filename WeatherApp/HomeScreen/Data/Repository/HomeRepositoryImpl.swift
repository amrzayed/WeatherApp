//
//  HomeRepositoryImpl.swift
//  WeatherApp
//
//  Created by amr zayed on 08/12/2024.
//

import Combine

class HomeRepositoryImpl: HomeRepositoryContract{

    let dataSource: HomeRemoteDataSourceContract
    init(dataSource: HomeRemoteDataSourceContract = HomeRemoteDataSource()) {
        self.dataSource = dataSource
    }
    func fetchCityWeather(city name: String) -> AnyPublisher<WeatherModel, NetworkError>{
        dataSource.getWeatherFor(city: name)
    }
}

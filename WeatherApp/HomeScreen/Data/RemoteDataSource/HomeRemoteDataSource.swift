//
//  HomeRemoteDataSource.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Combine

protocol HomeRemoteDataSourceContract{
    func getWeatherFor(city name: String)-> AnyPublisher<WeatherModel, NetworkError>
}

class HomeRemoteDataSource: HomeRemoteDataSourceContract{
    private let networkService: NetworkService
    
    init(networkService: NetworkServiceContract = NetworkService.shared) {
        self.networkService = networkService as! NetworkService
    }
    
    func getWeatherFor(city name: String)-> AnyPublisher<WeatherModel, NetworkError>{
        networkService.request(endpoint: "https://api.openweathermap.org/data/2.5/weather?q=\(name)&appid=f7c3177b1cd19ce6313f6dd246396b69", responseType: WeatherModel.self)
    }
}

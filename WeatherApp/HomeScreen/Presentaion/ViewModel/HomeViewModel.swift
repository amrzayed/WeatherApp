//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    var fetchHomeUseCaseUseCase: FetchHomeUseCaseContract
    @Published var model: WeatherModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(fetchHomeUseCaseUseCase: FetchHomeUseCaseContract = FetcHomeUseCase(),
         model: WeatherModel? = nil,
         isLoading: Bool = false,
         errorMessage: String? = nil
    ) {
        self.fetchHomeUseCaseUseCase = fetchHomeUseCaseUseCase
        self.model = model
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    func getCityWeather(name: String){
        self.isLoading = true
        self.errorMessage = nil
        fetchHomeUseCaseUseCase.execute(city: name)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] data in
                self?.isLoading = false
                print(data)
                self?.model = data
            }.store(in: &self.cancellables)
        
    }
}


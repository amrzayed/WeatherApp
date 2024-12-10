//
//  ContentView.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var cityName: String = ""
    @StateObject private var favoritesManager = FavoritesManager()
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderView()
            CityNameInput(cityName: $cityName)
            
            if viewModel.isLoading {
                LoadingView()
            } else if let error = viewModel.errorMessage {
                ErrorView(errorMessage: error)
            } else {
                CityWeatherView(viewModel: viewModel, cityName: $cityName, favoritesManager: favoritesManager)
                Divider()
                FavoriteCitiesList(favoritesManager: favoritesManager, onCitySelected: handleCitySelection)
            }
            
            Spacer()
            GetDetailsButton {
                fetchCityWeather()
            }
        }
        .padding()
    }
    
    private func fetchCityWeather() {
        guard !cityName.isEmpty else { return }
        viewModel.getCityWeather(name: cityName)
    }
    
    private func handleCitySelection(cityName: String) {
        self.cityName = cityName
    }
}

#Preview {
    HomeView()
}

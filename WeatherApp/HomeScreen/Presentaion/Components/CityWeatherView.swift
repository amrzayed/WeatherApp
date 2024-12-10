//
//  CityWeatherView.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct CityWeatherView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var cityName: String
    @ObservedObject var favoritesManager: FavoritesManager
    
    var body: some View {
            HStack {
                WeatherDetails(viewModel: viewModel)
                AddToFavoritesButton(cityName: cityName, favoritesManager: favoritesManager)
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 12)
            .padding(.vertical)
    }
}

//
//  AddToFavoritesButton.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct AddToFavoritesButton: View {
    let cityName: String
    @ObservedObject var favoritesManager: FavoritesManager
    
    var body: some View {
        Button {
            guard !cityName.isEmpty else { return }
            favoritesManager.addCity(cityName)
        } label: {
            Image(systemName: "heart")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 30, height: 30)
        }
    }
}

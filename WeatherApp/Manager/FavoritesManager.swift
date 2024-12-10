//
//  FavoritesManager.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteCities: [FavoriteCity] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    private let favoritesKey = "favoriteCities"
    
    init() {
        loadFavorites()
    }
    
    func addCity(_ city: String) {
        guard !favoriteCities.contains(where: { $0.name == city }) else { return }
        favoriteCities.append(FavoriteCity(name: city))
    }
    
    func removeCity(at offsets: IndexSet) {
        print("cities ==> ", favoriteCities)
        favoriteCities.remove(atOffsets: offsets)
    }
    
    func removeCity(name: String) {
            favoriteCities.removeAll { $0.name == name }
        }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteCities) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    private func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([FavoriteCity].self, from: savedData) {
            favoriteCities = decoded
        }
    }
}

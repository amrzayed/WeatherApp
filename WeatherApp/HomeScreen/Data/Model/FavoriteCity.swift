//
//  FavoriteCity.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import Foundation

struct FavoriteCity: Identifiable, Codable {
    var id = UUID()
    let name: String
}

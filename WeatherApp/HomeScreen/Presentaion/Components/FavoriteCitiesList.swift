//
//  FavoriteCitiesList.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct FavoriteCitiesList: View {
    @ObservedObject var favoritesManager: FavoritesManager
    var onCitySelected: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorite cities")
                .font(.headline)
            
            List {
                ForEach(favoritesManager.favoriteCities) { city in
                    Button {
                        onCitySelected(city.name)
                    } label: {
                        Text(city.name)
                    }
                }
                .onDelete(perform: favoritesManager.removeCity)
            }
            .listStyle(PlainListStyle())
        }
    }
}

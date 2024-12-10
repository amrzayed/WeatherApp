//
//  CityNameInput.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct CityNameInput: View {
    @Binding var cityName: String
    
    var body: some View {
        TextField("City Name", text: $cityName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

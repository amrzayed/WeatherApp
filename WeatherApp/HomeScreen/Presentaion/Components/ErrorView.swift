//
//  ErrorView.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text("Error: \(errorMessage)")
                .foregroundColor(.red)
        }
    }
}

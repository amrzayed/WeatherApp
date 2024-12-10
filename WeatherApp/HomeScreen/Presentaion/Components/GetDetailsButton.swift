//
//  GetDetailsButton.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct GetDetailsButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Get Details")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    GetDetailsButton(action: {})
}

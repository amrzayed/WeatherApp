//
//  LoadingView.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack(alignment: .center) {
            ProgressView("Loading...")
        }
    }
}

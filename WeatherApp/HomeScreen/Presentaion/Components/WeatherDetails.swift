//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by amr zayed on 10/12/2024.
//

import SwiftUI

struct WeatherDetails: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.model?.name ?? "")
                    .font(.headline)
                AsyncImage(url: viewModel.model?.weather?[0].weatherIconURL ?? URL(string: "")) { image in
                    image.resizable()
                } placeholder: {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 30, height: 30)
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            }
            
            Divider()
            VStack(alignment: .leading){
                Text(viewModel.model?.date ?? "")
                    .font(.headline)
                
                Text("\(viewModel.model?.main?.roundedTemp ?? 0)")
                    .font(.subheadline)
                Text("\(viewModel.model?.sys?.sunrise ?? 0)")
                    .font(.subheadline)
                Text("\(viewModel.model?.sys?.country ?? "")")
                    .font(.subheadline)
                Text("\(viewModel.model?.sys?.type ?? 0)")
                    .font(.subheadline)
                
            }
            Spacer()
        }
    }
}

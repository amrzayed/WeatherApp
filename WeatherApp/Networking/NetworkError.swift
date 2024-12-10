//
//  NetworkError.swift
//  WeatherApp
//
//  Created by amr zayed on 05/12/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError(Error)
    case serverError(Int)
    case unknownError
}

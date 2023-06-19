//
//  WeatherData.swift
//  WeatherApp
//
//  Created by macbookair on 2.06.2023.
//

import Foundation
import UIKit

struct WeatherDataResponse: Decodable {
    let result: [WeatherData]
}

struct WeatherData: Decodable {
    let date: String
    let day: String
    let icon: String
    let description: String
    let status: String
    let degree: String
    let min: String
    let max: String
    let night: String
    let humidity: String
}

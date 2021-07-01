//
//  Models.swift
//  WeatherSwiftUI
//
//  Created by calatinalper on 1.07.2021.
//

import Foundation

struct WeatherModel: Codable {
    let timezone : String
    
    let current: CurrentWeather
}


struct CurrentWeather: Codable {
    let temp : Float
    let humidity : Int
    let weather : [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main : String
    let description: String
}

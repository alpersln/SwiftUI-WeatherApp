//
//  ViewModel.swift
//  WeatherSwiftUI
//
//  Created by calatinalper on 1.07.2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var descriptionText: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
    @Published var humidity: String = ""
    
    init() {
        fetchWeather()
    }
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=41.0351&lon=28.9833&exclude=hourly,daily&units=metric&appid=2d75af67a4a39156475ea96c1626650a") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "no title"
                    self.descriptionText = model.current.weather.first?.description ?? "no description"
    
                    self.temp = "\(model.current.temp)°"
                    self.timezone = model.timezone
                    self.humidity = "%\(model.current.humidity) Humidity"
                    
                }
            }
            catch{
                print("failed")
            }
            
        }
        task.resume()
    }
}

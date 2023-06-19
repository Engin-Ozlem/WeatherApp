//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by macbookair on 3.06.2023.
//

import Foundation

struct WeatherListViewModel {
    let weatherList : [WeatherData]
    
    func numberOfRowsInSection() -> Int {
        return self.weatherList.count
    }
    
    func weatherAtIndex(_ index : Int) -> WeatherViewModel {
        let weather = self.weatherList[index]
        return WeatherViewModel(weatherData: weather)
    } //ikisini birbirine bağladık
    
    
}

struct WeatherViewModel {
    
    let weatherData : WeatherData
    
    var day : String {
        return self.weatherData.day
    }
    
    var icon : String {
        return self.weatherData.icon
    }
    
    var fahrein : String {
        return self.weatherData.degree
    }
}

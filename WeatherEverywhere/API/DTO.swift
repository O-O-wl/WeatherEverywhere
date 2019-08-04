//
//  WeatherModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.

import Foundation


// MARK: - ForcastDTO
struct ForcastDTO: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: WeatherDTO
    let hourly: WeathersDTO
    let daily: WeathersDTO
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
    case clearNight = "clear-night"
    case snow = "snow"
    case sleet = "sleet"
    case wind = "wind"
    case fog = "fog"
}

// MARK: - WeatherDTO
struct WeatherDTO: Codable {
    let icon: Icon
    
    let time: Double
    
    let summary: String
    
    let sunriseTime, sunsetTime: Double?
    
    let precipIntensity: Double
    let precipProbability: Double
    
    let humidity: Double
    let pressure: Double
    
    let windSpeed: Double
    let windBearing: Int
    
    let uvIndex: Int
    let visibility: Double
    
    let temperature: Double?
    let apparentTemperature: Double?
    
    let temperatureMin: Double?
    let temperatureMax: Double?
    
}

// MARK: - WeathersDTO
struct WeathersDTO: Codable {
    let data: [WeatherDTO]
}
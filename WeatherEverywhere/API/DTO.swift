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
    let currently: CurrentlyDTO
    let hourly: Hourly
    let daily: DailyDTO
    let offset: Int
}

// MARK: - Currently
struct CurrentlyDTO: Codable {
    let time: Double
    let summary: String
    let icon: Icon
    let precipIntensity, precipProbability: Double //밀리미터
    let precipType: Icon?
    let temperature, apparentTemperature, humidity: Double
    let pressure:Double
    let windSpeed, windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility: Double
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

// MARK: - Daily
struct DailyDTO: Codable {
    let summary: String
    let icon: Icon
    let data: [DatumDTO]
}

// MARK: - Datum
struct DatumDTO: Codable {
    let time: Double
    let summary: String
    let icon: Icon
    let sunriseTime, sunsetTime: Double
    let precipIntensity: Double
    let precipProbability: Double // 강수확률
    let precipType: Icon
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let humidity, pressure, windSpeed: Double
    let windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary: String
    let icon: Icon
    let data: [CurrentlyDTO]
}

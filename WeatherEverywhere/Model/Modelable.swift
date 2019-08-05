//
//  Modelable.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

// - MARK: - TotalModelable
typealias TotalModelable = ForcastModelable & CurrentWeatherModelable & HourlyWeatherModelable & DailyWeatherModelable & WeatherListModelable

// - MARK: - ForcastModelable
protocol ForcastModelable {
    var location: LocationModel? { get }
    var current: CurrentWeatherModelable? { get }
    var hourly: [HourlyWeatherModelable]? { get }
    var daily: [DailyWeatherModelable]? { get }
}

// - MARK: - WeatherListModelable
protocol WeatherListModelable {
    var time: Textable? { get }
    var location: LocationModel? { get }
    var temperature: Textable? { get }
    var wallPaper: Displayable? { get }
}

// - MARK: - CurrentWeatherModelable
protocol CurrentWeatherModelable: WeatherListModelable {
    var location: LocationModel? { get }
    var summary: Textable? { get }
    var temperature: Textable? { get }
    var day: Textable? { get }
    var time: Textable? { get }
    var wallPaper: Displayable? { get }
    var temperatureMax: Textable? { get }
    var temperatureMin: Textable? { get }
    var sunriseTime: Textable? { get }
    var sunsetTime: Textable? { get }
    var precipIntensity: Textable? { get }
    var precipProbability: Textable? { get }
    var humidity: Textable? { get }
    var pressure: Textable? { get }
    var wind: Textable? { get }
    var uv: Textable? { get }
    var visibility: Textable? { get }
    var apparentTemperature: Textable? { get}
}

// - MARK: - HourlyWeatherModelable
protocol HourlyWeatherModelable {
    var time: Textable? { get }
    var icon: Displayable? { get }
    var temperature: Textable? { get }
}

// - MARK: - DailyWeatherModelable
protocol DailyWeatherModelable {
    var day: Textable? { get }
    var icon: Displayable? { get }
    var temperatureMax: Textable? { get }
    var temperatureMin: Textable? { get }
}


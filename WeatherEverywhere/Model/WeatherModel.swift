//
//  Weather.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import Foundation

struct WeatherModel: ForcastModelable, CurrentWeatherModelable, DailyWeatherModelable, HourlyWeatherModelable {
    var current: CurrentWeatherModelable?
    let location: LocationModel?
    let icon: Icon?
    let time: Time?
    let day: Day?
    let summary: String?
    let sunriseTime, sunsetTime: Time?
    let precipIntensity: Precipitation?
    let precipProbability: Persentage?
    let humidity: Persentage?
    let pressure: Pressure?
    let wind: Wind?
    let uv: UV?
    let visibility: Visibility?
    let temperature: Temperature?
    let apparentTemperature: Temperature?
    let temperatureMax: Temperature?
    let temperatureMin: Temperature?
    var daily: [DailyWeatherModelable]?
    var hourly: [HourlyWeatherModelable]?
    
    init(location: LocationModel? = nil,
         icon: Icon? = nil,
         time: Time? = nil,
         day: Day? = nil,
         summary: String? = nil,
         sunriseTime: Time? = nil,
         sunsetTime: Time? = nil,
         precipIntensity: Precipitation? = nil,
         precipProbability: Persentage? = nil,
         humidity: Persentage? = nil,
         pressure: Pressure? = nil,
         wind: Wind? = nil,
         uv: UV? = nil,
         visibility: Visibility? = nil,
         temperature: Temperature? = nil,
         apparentTemperature: Temperature? = nil,
         temperatureMax: Temperature? = nil,
         temperatureMin: Temperature? = nil,
         daily: [DailyWeatherModelable]? = [],
         hourly: [HourlyWeatherModelable]? = []) {
        
        self.location = location
        self.icon = icon
        self.time = time
        self.day = day
        self.summary = summary
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
        self.precipIntensity = precipIntensity
        self.precipProbability = precipProbability
        self.humidity = humidity
        self.pressure = pressure
        self.wind = wind
        self.uv = uv
        self.visibility = visibility
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.temperatureMax = temperatureMax
        self.temperatureMin = temperatureMin
        self.daily = daily
        self.hourly = hourly
    }
    
    
}

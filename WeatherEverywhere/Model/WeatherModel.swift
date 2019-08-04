//
//  Weather.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import Foundation

struct WeatherModel: TotalModelable, Saveable {
    
    var location: LocationModel?
    var temperature: Textable?
    var temperatureMax: Textable?
    var temperatureMin: Textable?
    var icon: Displayable?
    var wallPaper: Displayable?
    var background: Displayable?
    var day: Textable?
    var time: Textable?
    var summary: Textable?
    var sunriseTime: Textable?
    var sunsetTime: Textable?
    var precipProbability: Textable?
    var humidity: Textable?
    var wind: Textable?
    var apparentTemperature: Textable?
    var precipIntensity: Textable?
    var pressure: Textable?
    var visibility: Textable?
    var uv: Textable?
    var current: CurrentWeatherModelable?
    var hourly: [HourlyWeatherModelable]?
    var daily: [DailyWeatherModelable]?
    
    init(location: LocationModel? = nil,
         icon: IconDTO? = nil,
         wallPaper: IconDTO? = nil,
         time: Time? = nil,
         day: Day? = nil,
         summary: Summary? = nil,
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
         current: CurrentWeatherModelable? = nil,
         daily: [DailyWeatherModelable]? = [],
         hourly: [HourlyWeatherModelable]? = []) {
        
        self.location = location
        self.icon = ICON(icon?.rawValue ?? "default")
        self.wallPaper = Wallpaper(icon?.rawValue ?? "default")
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
        self.current = current
        self.daily = daily
        self.hourly = hourly
    }
}

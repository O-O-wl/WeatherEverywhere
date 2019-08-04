//
//  Parser.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Parser {
    static func parse(forcastDTO: ForcastDTO, title: String) -> ForcastModelable? {
        let forcastModel = WeatherModel2(
            location: LocationModel(
                title: title,
                latitude: forcastDTO.latitude,
                longitude: forcastDTO.longitude),
            daily: forcastDTO.daily.data.map { parse(dailyDTO: $0)},
            hourly: forcastDTO.daily.data.map { parse(hourlyDTO: $0)}
        )
        return forcastModel
    }
    
    static func parse(dailyDTO: WeatherDTO) -> DailyWeatherModelable {
        let dailyModel = WeatherModel2(
            icon: dailyDTO.icon,
            day: Day(dailyDTO.time),
            temperatureMax: Temperature.init(dailyDTO.temperatureMax ?? 0),
            temperatureMin: Temperature(dailyDTO.temperatureMin ?? 0)
        )
        
        return dailyModel
    }
    
    static func parse(hourlyDTO: WeatherDTO) -> HourlyWeatherModelable {
        let hourlyModel = WeatherModel2(
            icon: hourlyDTO.icon,
            time: Time(hourlyDTO.time),
            temperature: Temperature(hourlyDTO.temperature ?? 0)
        )
        return hourlyModel
    }
    
    static func parse(currentDTO: WeatherDTO) -> CurrentWeatherModelable {
        let currentModel = WeatherModel2(
            summary: currentDTO.summary,
            sunriseTime: Time.init(currentDTO.sunriseTime ?? 0),
            sunsetTime: Time.init(currentDTO.sunsetTime ?? 0),
            precipIntensity: Precipitation(currentDTO.precipIntensity),
            precipProbability: Persentage(currentDTO.precipProbability),
            humidity: Persentage(currentDTO.humidity),
            pressure: Pressure(currentDTO.pressure),
            wind: Wind(speed: currentDTO.windSpeed, bearing: currentDTO.windBearing),
            uv: UV(currentDTO.uvIndex),
            visibility: Visibility(currentDTO.visibility),
            temperature: Temperature(currentDTO.temperature ?? 0),
            apparentTemperature: Temperature(currentDTO.apparentTemperature ?? 0),
            temperatureMax: Temperature(currentDTO.temperatureMax ?? 0),
            temperatureMin: Temperature(currentDTO.temperatureMin ?? 0)
            )
        return currentModel
    }
}

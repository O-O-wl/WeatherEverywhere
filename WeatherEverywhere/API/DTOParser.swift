//
//  Parser.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct DTOParser {
    
    static func parse(apiDTO: ApiDTO, title: String) -> ForcastModelable {
        let timeZone = apiDTO.timezone.timeZone
        let location = LocationModel(
            title: title,
            latitude: apiDTO.latitude,
            longitude: apiDTO.longitude)
        
        let forcastModel = WeatherModel(
            location: location,
            wallPaper: apiDTO.currently.icon,
            current: parse(currentDTO: apiDTO.currently, location: location, timeZone: timeZone, currentDay: apiDTO.daily.data[0]),
            daily: apiDTO.daily.data.map { parse(dailyDTO: $0, timeZone: timeZone) },
            hourly: apiDTO.hourly.data.map { parse(hourlyDTO: $0, timeZone: timeZone) }
        )
        return forcastModel
    }
    
    static func parse(currentDTO: WeatherDTO, location: LocationModel, timeZone: TimeZone, currentDay: WeatherDTO ) -> CurrentWeatherModelable {
        let currentModel = WeatherModel(
            location: location,
            icon: currentDTO.icon,
            wallPaper: currentDTO.icon,
            time: Time(currentDTO.time, timeZone: timeZone),
            day: Day(currentDTO.time, timeZone: timeZone),
            summary: Summary(currentDTO.summary),
            sunriseTime: Time(currentDay.sunriseTime ?? 0, timeZone: timeZone),
            sunsetTime: Time(currentDay.sunsetTime ?? 0, timeZone: timeZone),
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
    
    static func parse(hourlyDTO: WeatherDTO, timeZone: TimeZone) -> HourlyWeatherModelable {
        let hourlyModel = WeatherModel(
            icon: hourlyDTO.icon,
            time: Time(hourlyDTO.time, timeZone: timeZone),
            day: Day.init(hourlyDTO.time, timeZone: timeZone),
            temperature: Temperature(hourlyDTO.temperature ?? 0)
        )
        return hourlyModel
    }
    
    static func parse(dailyDTO: WeatherDTO, timeZone: TimeZone) -> DailyWeatherModelable {
        let dailyModel = WeatherModel(
            icon: dailyDTO.icon,
            day: Day(dailyDTO.time, timeZone: timeZone),
            temperatureMax: Temperature(dailyDTO.temperatureMax ?? 0),
            temperatureMin: Temperature(dailyDTO.temperatureMin ?? 0)
        )
        return dailyModel
    }
    
}

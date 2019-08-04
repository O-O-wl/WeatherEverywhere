//
//  Modelable.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

protocol DailyWeatherModelable {
    var day: Day { get }
    var icon: Icon { get }
    var temperatureMax: Temperature { get }
    var temperatureMin: Temperature { get }
}

protocol HourlyWeatherModelable {
    var time: Time { get }
    var icon: Icon { get }
    var temperature: Temperature { get }
}

protocol ForcastModelable: DailyWeatherModelable, HourlyWeatherModelable {
    var location: LocationModel { get }
    var hourly: [HourlyWeatherModelable] { get }
    var daily: [DailyWeatherModelable] { get }
}

//
//  Parser.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Parser {
    static func parse(dto: ForcastDTO) -> ForcastModelable? {
        return nil
    }
    static func parse(_ daily: WeatherDTO ) -> DailyWeatherModelable? {
        return nil
    }
    static func parse(_ hourly: WeatherDTO ) -> HourlyWeatherModelable? {
        return nil
    }
}

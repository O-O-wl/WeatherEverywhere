//
//  WeatherDetail.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

/// - Todo: 삭제

struct ForcastModel: ForcastModelable {
    var location: LocationModel
    
    let icon: Icon
    let time: Time
    let day: Day
    
    let summary: String
    let sunriseTime, sunsetTime: Time
    
    let precipIntensity: Precipitation
    let precipProbability: Persentage
    
    let humidity: Persentage
    let pressure: Atmosphere
    
    let wind: Wind
    
    let uv: UV
    let visibility: Visibility
    
    let temperature: Temperature
    let apparentTemperature: Temperature
    
    let temperatureMax: Temperature
    let temperatureMin: Temperature
    
    var daily: [DailyWeatherModelable]
    var hourly: [HourlyWeatherModelable]
    
}

//struct WeatherDetailModel: Storeable {
//    
//    var 현재날씨: WeatherModel
//    
//    var 최고기온: Temperature
//    var 최저기온: Temperature
//    
//    var 시간별날씨 = [WeatherModel]()
//    var 일자별날씨 = [WeatherModel]()
//    
//    var 설명: String
//    
//    var 일출시간: Time
//    var 일몰시간: Time
//    
//    var 강수확률: Persentage
//    var 습도: Persentage
//    
//    var 바람: Wind
//    var 체감온도: Temperature
//    
//    var 강수량: Precipitation
//    var 기압: Atmosphere
//    
//    var 가시거리: Visibility
//    var 자외선지수: UV
//    
//}

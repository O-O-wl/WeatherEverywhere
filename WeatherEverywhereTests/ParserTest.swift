//
//  WeatherEverywhereTests.swift
//  WeatherEverywhereTests
//
//  Created by 이동영 on 01/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import XCTest
@testable import WeatherEverywhere

class ParserTest: XCTestCase {
    // Given
    lazy var forcastDTO: ForcastDTO = { ForcastDTO.init(latitude: 37.01, longitude: 127.01, timezone: "Asia/Seoul", currently: weatherDTO, hourly: WeathersDTO.init(data: [weatherDTO]), daily: WeathersDTO.init(data: [weatherDTO])) }()
    
    let weatherDTO = WeatherDTO.init(icon: .clearDay, time: 1509993277, summary: "맑음", sunriseTime: 1509993277, sunsetTime: 1509993277, precipIntensity: 10, precipProbability: 0.8, humidity: 0.7, pressure: 1015, windSpeed: 3, windBearing: 360, uvIndex: 1, visibility: 9.7, temperature: 36.6, apparentTemperature: 40.5, temperatureMin: 22, temperatureMax: 49)

    func testParseDailyModel() {
        //When
        let result = Parser.parse(dailyDTO: weatherDTO)
        //Then
        XCTAssertNotNil(result)
    }
    
    func testParseHourlyModel() {
        //When
        let result = Parser.parse(hourlyDTO: weatherDTO)
        //Then
        XCTAssertNotNil(result)
    }

    func testParseForcastModel() {
        //When
        let result = Parser.parse(forcastDTO: forcastDTO,title: "강남구")
        //Then
        XCTAssertNotNil(result)
    }
}

//
//  CurrentWeatherDetailTableView.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class CurrentWeatherDetailController: NSObject , UITableViewDataSource {
    
    var currentWeather: CurrentWeatherModelable?
    
    init (currentWeather model: CurrentWeatherModelable?) {
        self.currentWeather = model
    }
}
// MARK: - UITableViewDataSource
extension CurrentWeatherDetailController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentDetailCell", for: indexPath)
        guard
            let currentWeather = currentWeather,
            let currentDetailCell = cell as? CurrentDetailCell,
            let category = Category(rawValue: indexPath.row)
            else { return cell }
        currentDetailCell.sync(category, currentWeather)
        
        return currentDetailCell
    }
}
// MARK: - Categoty
enum Category:Int {
    
    typealias Detail = (name: String, value: Textable?)
    
    case sunrise_sunset = 0
    case precipProbability_humidity
    case wind_apparentTemperature
    case precipIntensity_pressure
    case visibility_uv
    
    func first (model: CurrentWeatherModelable) -> Detail {
        switch self {
        case .sunrise_sunset:
            return ("일출",model.sunriseTime)
        case .precipProbability_humidity:
            return ("비 올 확률",model.precipProbability)
        case .wind_apparentTemperature:
            return ("바람", model.wind)
        case .precipIntensity_pressure:
            return ("강수량",model.precipIntensity)
        case .visibility_uv:
            return ("가시거리",model.visibility)
        }
    }
    
    func second (model: CurrentWeatherModelable) -> Detail {
        switch self {
        case .sunrise_sunset:
            return ("일몰",model.sunsetTime)
        case .precipProbability_humidity:
            return ("습도",model.humidity)
        case .wind_apparentTemperature:
            return ("체감", model.apparentTemperature)
        case .precipIntensity_pressure:
            return ("기압", model.pressure)
        case .visibility_uv:
            return ("자외선 지수", model.uv)
        }
    }
}


//
//  DailyWeatherTableView.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class DailyWeathersController: NSObject {
    
    var dailyWeathers: [DailyWeatherModelable]
    
    init(dailyWeathers models: [DailyWeatherModelable]) {
        self.dailyWeathers = models
    }
    
}
// MARK: - DataSource
extension DailyWeathersController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dailyWeathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyWeatherCell", for: indexPath)
        
        guard let dailyCell = cell as? DailyWeatherCell else {
            return cell
        }
        dailyCell.sync(model: dailyWeathers[indexPath.row])
        return dailyCell
    }
    
    
}
// MARK: - Delegate
extension DailyWeathersController: UITableViewDelegate {
    
}

//
//  DataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class RegionDataSource: NSObject, UITableViewDataSource {
    private var weathers = [WeatherModel]()
    
    override init() {
        super.init()
        setup()
    }
    
    func setup() {
        let w1 = WeatherModel()
        w1.currentTime = Date()
        w1.location = "제주도"
        w1.temperature = 10
        w1.weatherImage = UIImage(named: "blueSky.jpg")
        let w2 = WeatherModel()
        weathers.append(w1)
        weathers.append(w2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath)
        guard let weatherCell = cell as? WeatherCell else { return cell }
        /// - Todo: 삭제
//        let time = weathers[row].시간?.description
        let time = "\(weathers[row].currentTime)"
        weatherCell.currentTimeLabel.text = time
        weatherCell.locationLabel.text = weathers[row].location
        weatherCell.temperatureLabel.text = "\(weathers[row].temperature)"
        weatherCell.weatherImageView.image = weathers[row].weatherImage
        return weatherCell
    }
    
}


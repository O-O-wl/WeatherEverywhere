//
//  DataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    private var weathers = [WeatherModel]()
    
    override init() {
        super.init()
        setup()
    }
    
    func setup() {
        let w1 = WeatherModel()
        w1.location = "제주시"
        w1.temperature = 40
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
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath) as! WeatherCell
        cell.currentTimeLabel.text = weathers[row].currentTime.description
        cell.locationLabel.text = weathers[row].location
        cell.temperatureLabel.text = "\(weathers[row].temperature)"
        cell.weatherImageView.image = weathers[row].weatherImage
        return cell
    }
    
    
}


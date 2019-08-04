//
//  DataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class WeatherListDataSource: NSObject, UITableViewDataSource {
    private var weathers = [WeatherListModelable]()
    
    override init() {
        super.init()
        setup()
    }
    
    func setup() {
        weathers.removeAll()
        
        weathers = ModelStore.shared.getAll().compactMap{ $0.current } as! [WeatherListModelable]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        setup()
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath)
        guard let weatherCell = cell as? WeatherCell else { return cell }
        /// - Todo: 삭제
        weatherCell.locationLabel.text = weathers[row].location?.description
        weatherCell.temperatureLabel.text = weathers[row].temperature?.description
        weatherCell.currentTimeLabel.text = weathers[row].time?.description
        weatherCell.weatherImageView?.image = weathers[row].wallPaper?.description
        return weatherCell
    }
    
}


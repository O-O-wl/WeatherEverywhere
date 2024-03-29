//
//  HourlyWeathersController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 06/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit


class HourlyWeathersController: NSObject {
    
    var hourlyWeathers: [HourlyWeatherModelable]
    
    init(hourlyWeathers models: [HourlyWeatherModelable]) {
        self.hourlyWeathers = models
    }
    
}
extension HourlyWeathersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyWeatherCell", for: indexPath)
        guard let hourlyCell = cell as? HourlyWeatherCell else { return cell }
        hourlyCell.sync(model: self.hourlyWeathers[indexPath.row])
        return hourlyCell
    }
    
}
extension HourlyWeathersController: UICollectionViewDelegate {
    
}

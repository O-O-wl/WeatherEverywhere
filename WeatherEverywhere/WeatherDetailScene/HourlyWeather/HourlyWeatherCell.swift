//
//  HourlyWeatherCell.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 06/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    let key = "hourlyWeatherCell"
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func sync(model: HourlyWeatherModelable) {
        self.dayLabel.text = model.day?.description
        self.timeLabel.text = model.time?.description
        self.iconImageView.image = model.icon?.description
        self.temperatureLabel.text = model.temperature?.description
    }
}

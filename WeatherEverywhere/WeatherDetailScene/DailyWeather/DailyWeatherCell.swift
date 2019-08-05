//
//  DailyWeatherCell.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 06/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class DailyWeatherCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func sync(model: DailyWeatherModelable) {
        self.dayLabel.text = model.day?.description
        self.temperatureMaxLabel.text = model.temperatureMax?.description
        self.temperatureMinLabel.text = model.temperatureMin?.description
        self.iconImageView.image = model.icon?.description
    }
    
}

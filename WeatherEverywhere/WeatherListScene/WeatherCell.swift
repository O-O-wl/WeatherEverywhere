//
//  WeatherCellTableViewCell.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let reuseID = "WeatherCellReuseID"
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        currentTimeLabel.contentMode = .scaleAspectFit
        temperatureLabel.contentMode = .scaleAspectFit
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func sync(model: WeatherListModelable) {
        currentTimeLabel.text = model.time?.description
        locationLabel.text = model.location?.description
        temperatureLabel.text = model.temperature?.description
        weatherImageView.image = model.wallPaper?.description
    }
    
}

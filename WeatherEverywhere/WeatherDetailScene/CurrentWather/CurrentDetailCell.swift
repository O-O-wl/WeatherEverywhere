//
//  CurrentDetailCell.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 07/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation
import UIKit


class CurrentDetailCell: UITableViewCell {
    
    @IBOutlet weak var firstDetailNameLabel: UILabel!
    @IBOutlet weak var secondDetailNameLabel: UILabel!
    
    @IBOutlet weak var firstDetailValueLabel: UILabel!
    @IBOutlet weak var secondDetailValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func sync(_ category: Category,_ model: CurrentWeatherModelable) {
        firstDetailNameLabel.text = category.first(model: model).name
        firstDetailValueLabel.text = category.first(model: model).value?.description
        
        secondDetailNameLabel.text = category.second(model: model).name
        secondDetailValueLabel.text = category.second(model: model).value?.description
    }

}

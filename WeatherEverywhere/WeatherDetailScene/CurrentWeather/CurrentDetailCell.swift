//
//  DetailCell.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

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

        // Configure the view for the selected state
    }

}

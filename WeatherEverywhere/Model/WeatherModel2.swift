//
//  WeatherModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class WeatherModel2: NSObject {

    var currentTime: Date = Date()
    var location: String = "서울특별시"
    var temperature: Int = 0
    var weatherImage: UIImage? = UIImage(named: "rain.jpg")

}

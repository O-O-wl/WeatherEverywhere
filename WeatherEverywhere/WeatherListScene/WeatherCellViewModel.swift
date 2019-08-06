//
//  WeatherCellViewModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 07/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import Foundation

typealias StringHandler = (String?) -> Void
typealias UIImageHander = (UIImage?) -> Void

struct WeatherCellViewModel {
    // MARK: - Properties
    var currentTime: Textable? {
        didSet(newValue) {
            currentTimeHandler(newValue?.description)
        }
    }
    var location: Textable? {
        didSet(newValue) {
            locationHandler(newValue?.description)
        }
    }
    var temperature: Textable? {
        didSet(newValue) {
            temperatureHandler(newValue?.description)
        }
    }
    var weatherImage: Displayable? {
        didSet(newValue) {
            weatherImageHandler(newValue?.description)
        }
    }
    // MARK: - Methods
    var currentTimeHandler: StringHandler
    var locationHandler: StringHandler
    var temperatureHandler: StringHandler
    var weatherImageHandler: UIImageHander
}

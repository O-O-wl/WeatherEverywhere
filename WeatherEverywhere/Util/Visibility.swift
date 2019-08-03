//
//  Visibility.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Visibility: Textable {
    static let symbol = "km"
    private let distance: Double
    
    var description: String {
        let distanceString = String(format: "%.1f", distance)
        return "\(distanceString)\(Visibility.symbol)"
    }
    
}


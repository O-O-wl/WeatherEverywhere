//
//  Atmosphere.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Pressure: Textable {
    // MARK: - Properties
    static let symbol = "hPa"

    private let value: Double
    
    init(_ value: Double) {
        self.value = value
    }
    
    var description: String {
        return "\(Int(value))\(Pressure.symbol)"
    }
}

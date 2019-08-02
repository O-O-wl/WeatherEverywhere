//
//  Atmosphere.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Atmosphere: CustomStringConvertible {
    // MARK: - Properties
    static let symbol = "hPa"

    private let value: Double?
    
    var description: String {
        return "\(Int(value ?? 0))\(Atmosphere.symbol)"
    }
}

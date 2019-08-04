//
//  Precipitation .swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Precipitation: Textable {
    // MARK: - Properties
    static let symbol = "cm"
    private let height: Double
    
    var description: String {
        let heightString = String(format:"%.1f", height)
        return "\(heightString) \(Precipitation.symbol)"
    }
    
    // MARK: - Methods
    init(_ height: Double) {
        self.height = height
    }
}

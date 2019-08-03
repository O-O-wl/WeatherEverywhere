//
//  Percentage.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Persentage: Textable {
    // MARK: - Properties
    static let symbol = "%"
    private var value : Double
    
    
    var description: String {
        return "\(convert())\(Persentage.symbol)"
    }
    
    // MARK: - Methods
    private func convert() -> Int {
        return Int((value) * 100)
    }
}

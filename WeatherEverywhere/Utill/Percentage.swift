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
    
    private var value : Double?
    
    var description: String {
        return "\(get())\(Persentage.symbol)"
    }
    
    // MARK: - Methods
    func get() -> Int {
        return Int((value ?? 0) * 100)
    }
}

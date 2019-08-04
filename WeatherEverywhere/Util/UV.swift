//
//  UV.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct UV: Textable {
    // MARK: - Properties
    private let level: Int
    
    var description: String {
        return String(level)
    }
    
    // MARK: - Methods
    init(_ level: Int) {
        self.level = level
    }
}


//
//  UV.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct UV: Textable {
    private let level: Int
    
    var description: String {
        return String(level)
    }
    
    init(_ level: Int) {
        self.level = level
    }
}


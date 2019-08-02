//
//  Time.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Time: Textable {
    // MARK: - Properties
    private var hour: Int
    private var minute: Int
    private var second: Int
    private var meridiem: Meridiem
    
    var description: String {
        return "\(meridiem) \(hour):\(minute)"
    }
}
// MARK: - + Nested Type
extension Time {
    enum Meridiem {
        case AM
        case PM
    }
}

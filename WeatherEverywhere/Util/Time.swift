//
//  Time.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

extension String {
    var timeZone: TimeZone {
        return TimeZone.init(identifier: self) ?? TimeZone.current
    }
}

struct Time: Textable {
    // MARK: - Properties
    private var hour: Int
    private var minute: Int
    private var second: Int
    private var meridiem: Meridiem
    
    var description: String {
        return "\(meridiem) \(hour):\(String(format:"%02d",minute))"
    }
    
    // MARK: - Methods
    init(_ unixTime: TimeInterval, timeZone: TimeZone) {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        hour = calendar.component(.hour, from: date)
        self.minute = calendar.component(.minute, from: date)
        self.second = calendar.component(.second, from: date)
        self.meridiem = hour > 12 ? .PM : .AM
        self.hour = hour%12
    }
}
// MARK: - + Nested Type
extension Time {
    
    enum Meridiem: String, Textable {
        // MARK: - Cases
        case AM = "AM"
        case PM = "PM"
        
        // MARK: - Properties
        var description: String {
            switch self {
            case .AM: return "오전"
            case .PM: return "오후"
            }
        }
        
    }
}

//
//  Day.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

enum Day: Int, Textable {
    // MARK: - Case
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
    
    // MARK: - Properties
    var description: String {
        switch self {
        case .sunday:
            return "일요일"
        case .monday:
            return "월요일"
        case .tuesday:
            return "화요일"
        case .wednesday:
            return "수요일"
        case .thursday:
            return "목요일"
        case .friday:
            return "금요일"
        case .saturday:
            return "토요일"
        }
    }
    
    // MARK: - Methods
    init(_ unixTime: TimeInterval) {
        let date = Date.init(timeIntervalSince1970: unixTime)
        let dayIndex = Calendar.current.component(.day, from: date)
        
        self = Day(rawValue: dayIndex%7) ?? .sunday
    }
    
}

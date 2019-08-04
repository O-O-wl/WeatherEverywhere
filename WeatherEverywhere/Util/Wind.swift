//
//  Wind.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation


struct Wind: Textable {
    // MARK: - Properties
    private let direction: Direction
    private let speed: MeterPerSecond
    
    init(speed: Double, bearing: Int) {
//        self.speed = MeterPerSec?ond.init(
        self.direction = Direction(angle: bearing) ?? .NO
        self.speed = MeterPerSecond(speed)
    }
    
    var description: String {
        return "\(direction) \(speed)"
    }
    
    
}
// MARK: - Speed
struct MeterPerSecond: Textable {
    // MARK: - Properties
    static let symbol = "m/s"
    
    private var value: Double
    
    init(_ value: Double) {
        self.value = value
    }
    
    var description: String {
        let valueString = String(format:"%.1f",value)
        return "\(valueString) \(MeterPerSecond.symbol)"
    }
}
// MARK: - Direction
enum Direction: Int, Textable {
    
    init?(angle: Int) {
        self.init(rawValue: (angle % 360) / 22)
    }
    // MARK: - Cases
    case NO = -1
    case N
    case NNE
    case NE
    
    case ENE
    case E
    case ESE
    
    case SE
    case SSE
    case S
    case SSW
    case SW
    
    case WSW
    case W
    case WNW
    
    case NW
    case NNW
    
    // MARK: - Properties
    var description: String {
        switch self {
        case .NO:
            return "무"
        case .N:
            return "북"
        case .NNE:
            return "북북동"
        case .NE:
            return "북동"
        case .ENE:
            return "동북동"
        case .E:
            return "동"
        case .ESE:
            return "동남동"
        case .SE:
            return "남동"
        case .SSE:
            return "남남동"
        case .S:
            return "남"
        case .SSW:
            return "남남서"
        case .SW:
            return "남서"
        case .WSW:
            return "서남서"
        case .W:
            return "서"
        case .WNW:
            return "서북서"
        case .NW:
            return "북서"
        case .NNW:
            return "북북서"
        }
    }
}

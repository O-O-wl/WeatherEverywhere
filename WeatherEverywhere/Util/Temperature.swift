//
//  Temperature.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

struct Temperature: Textable {
    // MARK: - Properties
    private var value: Double
    private var degree: Degree
    
    var description: String {
        let valueString = String(format: "%.1f", value)
        return valueString
    }
    
    // MARK: - Methods
    init(_ value: Double, _ degree: Degree = .celsius) {
        self.value = value
        self.degree = degree
    }
    
    mutating func convert(to another: Degree) -> Temperature {
        self.value = self.degree.converting(to: another)(self.value)
        self.degree = another
        return self
    }
    
}
// MARK: - + Nested Type 
extension Temperature {
    
    enum Degree: CustomStringConvertible {
        // MARK: - Cases
        case celsius
        case fahrenheit
        
        // MARK: - Properties
        var symbol: String {
            switch self {
            case .celsius:
                return "℃"
            case .fahrenheit:
                return "℉"
            }
        }
        
        var description: String {
            return self.symbol
        }
        
        // MARK: - Methods
        func converting(to: Degree) -> (Double) -> Double {
            switch (self,to) {
            case (.celsius,.fahrenheit):
                return { c in (c * 1.8) + 32 }
            case (.fahrenheit,.celsius):
                return { f in (f - 32) / 1.8 }
            case (.celsius,.celsius):
                return { c in c }
            case (.fahrenheit,.fahrenheit): return { f in f }
            }
        }
    }
    
}

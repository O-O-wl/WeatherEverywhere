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
    private var value: Int
    private var degree: Degree
    
    var description: String {
        return "\(value)\(degree)"
    }
    
    // MARK: - Methods
    mutating func convert(to anther: Degree) {
        self.value = self.degree.converting(to: anther)(self.value)
        self.degree = anther
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
        func converting(to: Degree) -> (Int) -> Int {
            switch (self,to) {
            case (.celsius,.fahrenheit):
                return { c in Int(Double(c) * 1.8 + 32) }
            case (.fahrenheit,.celsius):
                return { i in Int(Double(i-32)/1.8) }
            case (.celsius,.celsius):
                return { i in i }
            case (.fahrenheit,.fahrenheit): return { i in i }
            }
        }
    }
    
}

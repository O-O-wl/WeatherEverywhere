//
//  Temperature.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 03/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation



struct Temperature: CustomStringConvertible {
    private var value: Int
    private var degree: Degree
    
    var description: String {
        return "\(value)\(degree)"
    }
    
    mutating func convert(to anther: Degree) {
        self.value = self.degree.converting(to: anther)(self.value)
        self.degree = anther
    }
    
}
// MARK: - Degree
extension Temperature {
    
    enum Degree {
        case celsius
        case fahrenheit
        
        var symbol: String {
            switch self {
                
            case .celsius:
                return "℃"
            case .fahrenheit:
                return "℉"
            }
        }
        
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

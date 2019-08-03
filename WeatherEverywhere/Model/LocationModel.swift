//
//  LocationModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

protocol Queriable {
    typealias Query  = String
    func toQuery() -> Query
}

struct LocationModel: Codable, Queriable {
    private let latitude: Double
    private let longitude: Double
    
    init (latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func toQuery() -> Query {
        let query = "\(latitude),\(longitude)"
        return query
    }
    
    
}

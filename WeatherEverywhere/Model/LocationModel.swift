//
//  LocationModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit


struct LocationModel: Codable, Queriable, Saveable, Textable {
    
    private let title: String
    private let latitude: Double
    private let longitude: Double
    
    var description: String {
        return title
    }
    
    init (title: String, latitude: Double, longitude: Double) {
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func toQuery() -> Query {
        let query = "\(latitude),\(longitude)"
        return query
    }
    
}

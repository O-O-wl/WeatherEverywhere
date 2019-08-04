//
//  Queriable.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

protocol Queriable {
    typealias Query  = String
    
    func toQuery() -> Query
}

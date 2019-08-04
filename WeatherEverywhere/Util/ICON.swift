//
//  File.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//
import UIKit
import Foundation

struct ICON: Displayable {
    let resourceName: String
    
    var description: UIImage? {
        return UIImage(named: resourceName)
    }
    
    init(_ resourceName: String) {
        self.resourceName = resourceName
    }
}

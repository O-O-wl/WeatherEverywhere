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
    // MARK: - Properties
    private static let suffix: String = ".png"
    let resourceName: String
    
    var description: UIImage? {
        let imageName = resourceName + ICON.suffix
        return UIImage(named: imageName)
    }
    
    // MARK: - Methods
    init(_ resourceName: String) {
        self.resourceName = resourceName
    }
}

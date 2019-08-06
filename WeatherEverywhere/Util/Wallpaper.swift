//
//  WallPaper.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//
import UIKit
import Foundation

struct Wallpaper: Displayable {
    // MARK: - Properties
    private static let prefix = "bg_"
    private let resourceName: String
    
    var description: UIImage? {
        let imageName = Wallpaper.prefix + resourceName
        return UIImage(named: imageName)
    }
    
    // MARK: - Methods
    init(_ resourceName: String) {
        self.resourceName = resourceName
    }
}

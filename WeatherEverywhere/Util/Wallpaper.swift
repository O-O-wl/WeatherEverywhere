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
    private static let suffix = ".jpg"
    private let resourceName: String
    
    var description: UIImage? {
        let imageName = Wallpaper.prefix + resourceName + Wallpaper.suffix
        return UIImage(named: imageName)
    }
    
    // MARK: - Methods
    init(_ resourceName: String) {
        self.resourceName = resourceName
    }
}

//
//  WeatherListViewModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation


protocol WeatherListViewBindable {
    var models: [WeatherListModelable] { get set }
    var command: ([WeatherListModelable]) -> Void { get set }
}

struct WeatherListViewModel: WeatherListViewBindable {
    var command: ([WeatherListModelable]) -> Void
    
    var models: [WeatherListModelable] {
        didSet(newModels){
            command(newModels)
        }
    }
    
}



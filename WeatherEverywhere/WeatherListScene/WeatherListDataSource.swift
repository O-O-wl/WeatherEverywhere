//
//  DataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

//class WeatherListDataSource: NSObject, UITableViewDataSource {
//    
//    private var weathers : [WeatherListModelable] {
//        return ModelStore.shared.getCurrentModels()
//        
//    }
//    
//    override init() {
//        super.init()
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weathers.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard
//            let weatherCell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath) as? WeatherCell else { return WeatherCell() }
//        weatherCell.sync(model: weathers[indexPath.row])
//        return weatherCell
//    }
//    
//}



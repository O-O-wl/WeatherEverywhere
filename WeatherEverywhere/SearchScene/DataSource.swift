//
//  DataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 01/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

class DataSource: NSObject, UITableViewDataSource {
    
    var regions: [MKMapItem] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        resultCell.textLabel?.text = regions[indexPath.row].placemark.title
        return resultCell
    }
}

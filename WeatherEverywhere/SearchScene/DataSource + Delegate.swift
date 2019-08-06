//
//  SearchResultDataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

// MARK: - + MKPlacemark extension
extension MKPlacemark {
    
    var address: String? {
        let components = [ self.country, self.administrativeArea, self.locality, self.subLocality ]
        return components
            .compactMap { $0 }
            .joined(separator: " ")
    }
    
}

// MARK: - + DataSource
extension SearchResultTableViewController: UITableViewDataSource {
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let currentPlacemark = locals[row].placemark
        cell.textLabel?.text = currentPlacemark.address
        return cell
    }
    
}
// MARK: - + Delegate
extension SearchResultTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let place = locals[row].placemark
        let localModel = LocationModel(
            title: place.locality ?? "---",
            latitude: place.coordinate.latitude,
            longitude: place.coordinate.longitude
        )
        
        WeatherAPI.request(queriable: localModel) {
            dto in
            let model = DTOParser.parse(apiDTO: dto, title: localModel.description)
            ModelStore.shared.store(model)
            self.dissmiss()
        }
        self.dissmiss()
    }
}

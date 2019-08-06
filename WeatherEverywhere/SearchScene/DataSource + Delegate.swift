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
        return searchAutoCompletions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = searchAutoCompletions?[row].title
        cell.detailTextLabel?.text = searchAutoCompletions?[row].subtitle
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
        guard let searchContent = searchAutoCompletions?[row] else { return }
        let req = MKLocalSearch.Request(completion: searchContent)
        
        search(using: req) {
            res,err  in
            let placeMark = res?.mapItems[0].placemark
            let title = placeMark?.locality ?? "---"
            
            guard let latitude = placeMark?.coordinate.latitude,
                let longitude = placeMark?.coordinate.longitude
                else { return }
    
            let loc = LocationModel(title: title,
                                    latitude: latitude,
                                    longitude: longitude)
            
            WeatherAPI.request(queriable: loc ) {
                dto in
                let model = DTOParser.parse(apiDTO: dto, title: loc.description)
                ModelStore.shared.store(model)
                self.dissmiss()
            }
            self.dissmiss()
        }
    }
}

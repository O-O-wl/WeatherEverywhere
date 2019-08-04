//
//  SearchResultDataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

extension LocalSearcher: UITableViewDataSource {
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionCell.reuseID, for: indexPath)
        guard let suggestionCell = cell as? SuggestionCell else { return cell }
        let row = indexPath.row
        
        let currentPlacemark = locals[row].placemark
        suggestionCell.textLabel?.text = currentPlacemark.address
        return suggestionCell
    }
    
}

extension LocalSearcher: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("editingStyle")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("didDeselectRowAt")
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let place = locals[row].placemark
        let localModel = LocationModel(
            title: place.locality ?? "이름 없음",
            latitude: place.coordinate.latitude,
            longitude: place.coordinate.longitude
        )
        UserDefaultsManager.save(models: [localModel])
    }
}

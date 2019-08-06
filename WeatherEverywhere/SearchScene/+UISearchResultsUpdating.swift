//
//  LocalSearcher.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit


// MARK: - + UISearchResultsUpdating
extension SearchResultTableViewController: UISearchResultsUpdating {
    // MARK: - Methods
    func updateSearchResults(for searchController: UISearchController) {
        search(for: searchController.searchBar.text , complete: { self.searchItemTableView.reloadData() })
    }
}

extension SearchResultTableViewController {
    func search(for query: String?, complete: (() -> Void)? = nil) {
        guard query != nil else { return }
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        search(using: searchRequest, complete ?? {})
    }
    
    private func search(using request: MKLocalSearch.Request, _ complete: @escaping () -> Void) {
        localSearch = MKLocalSearch(request: request)
        localSearch.start {
            res, err in
            guard let res = res else { return }
            self.locals.removeAll()
            self.locals.append(contentsOf: res.mapItems )
            complete()
        }
    }
    
    func currentLocation() -> LocationModel {
        let currentLocation = MKUserLocation.init()
        
        return LocationModel.init(
            title: currentLocation.title ?? "---",
            latitude: currentLocation.coordinate.latitude,
            longitude: currentLocation.coordinate.longitude)
    }
    
}

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
        searchCompleter.queryFragment = searchController.searchBar.text ?? ""
        
    }
}

extension SearchResultTableViewController {
    
    func search(using request: MKLocalSearch.Request, completion: @escaping (MKLocalSearch.Response? , Error?) -> () ){
        localSearch = MKLocalSearch(request: request)
        localSearch.start {
            res, err in
            completion(res,err)
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

extension SearchResultTableViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchAutoCompletions = completer.results
        self.searchItemTableView.reloadData()
    }
    
}


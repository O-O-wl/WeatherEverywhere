//
//  SeachViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 01/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UITableViewController {
    
    // MARK: - Properties
    private let searchController = UISearchController(searchResultsController: nil)
    private var boundingRegion: MKCoordinateRegion = MKCoordinateRegion(center: MK, latitudinalMeters: 1_2000, longitudinalMeters: 1_2000)
    private var dataSource = DataSource()
    
    private var localFinder: MKLocalSearch = MKLocalSearch()
    
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.tableView.dataSource = dataSource
    }
    
    func setup() {
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
}
// MARK: - + UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        search(for: searchController.searchBar.text ?? "")
    }
    
    func search(for query: String) {
        
    }
}


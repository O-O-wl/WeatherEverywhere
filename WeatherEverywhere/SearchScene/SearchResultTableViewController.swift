//
//  SearchResultTableViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController {
    
    // MARK: - Properties
    private var searchController: UISearchController!
    private var searcher = LocalSearcher()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        self.tableView.dataSource = searcher
        self.tableView.delegate = searcher
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barStyle = .blackTranslucent
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
//        definesPresentationContext = true
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
// MARK: - + UISearchResultsUpdating
extension SearchResultTableViewController: UISearchResultsUpdating {
    // MARK: - Methods
    func updateSearchResults(for searchController: UISearchController) {
        searcher.search(for: searchController.searchBar.text , complete: { self.tableView.reloadData() }) 
    }
}

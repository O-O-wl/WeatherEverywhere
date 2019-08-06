//
//  SearchResultTableViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//
import MapKit
import UIKit

class SearchResultTableViewController: UIViewController {
    
    // MARK: - Properties
    private var searchController: UISearchController!
    
    var localSearch = MKLocalSearch.init(request: MKLocalSearch.Request())
    let searchCompleter = MKLocalSearchCompleter()
    var searchAutoCompletions: [MKLocalSearchCompletion]?
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchItemTableView: UITableView!

    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupBackButton()
        self.searchItemTableView.dataSource = self
        self.searchItemTableView.delegate = self
        self.searchCompleter.delegate = self
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barStyle = .blackTranslucent
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:#selector(dissmiss))
        backButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = backButton
    }
    
    @objc func dissmiss() {
        self.dismiss(animated: true, completion: {} )
    }
    
    
    // MARK: - IBActions
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  ReguionTableViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

class WeatherListController: UITableViewController {
    
    // MARK: - Properties
    let dataSource = WeatherListDataSource()
    // MARK: - IBOutlets
    @IBOutlet weak var celsiusDegreeBarButton: UIButton!
    @IBOutlet weak var fahrenheitDegreeBarButton: UIButton!
    @IBOutlet weak var remainerView: UIView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    // MARK: - IBActions
    @IBAction func celsiusButtonDidTap(_ sender: Any) {
       
    }
    
    @IBAction func fahrenheitButtonDidTap(_ sender: Any) {
        WeatherAPI.request(queriable: LocationModel(title: "서울",latitude: 30.1, longitude: 13.9)) {
            (f) in
            let model = DTOParser.parse(apiDTO: f, title: "sada")
            ModelStore.shared.store(model)
            self.tableView.reloadData()
        }
    }
    
}

//
//  ReguionTableViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

class RegionTableViewController: UITableViewController {
    
    // MARK: - Properties
    let dataSource = RegionDataSource()
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
        WeatherAPI.requestForecast(query: LocationModel(latitude: 37.1, longitude: 127.9)) { (_) in
            // 성공
            let alert = UIAlertController(title: "Thread.isMainThread", message: "\(Thread.isMainThread)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "\(Date())", style: .cancel, handler: nil ))
            self.present(alert, animated: true, completion: {} )
        }
    }
    
}

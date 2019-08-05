//
//  WeatherDetailViewController.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 05/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var wallpaperImageView: UIImageView!
    @IBOutlet weak var hourlyWeathersCollectionView: UICollectionView!
    @IBOutlet weak var dailyWeathersTableView: UITableView!
    @IBOutlet weak var currentWeatherDetailTableView: UITableView!
    
    var selectedIndex: Int = 0
    
    var model: ForcastModelable {
        return ModelStore.shared.getForcastModels(at: selectedIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ModelStore.shared.register(self)
        sync()
        
    }
    
    func sync() {
        locationLabel.text = model.location?.description
        summaryLabel.text = model.current?.summary?.description
        currentTemperatureLabel.text = model.current?.temperature?.description
    }
    
}
// Mark: - + Observer
extension WeatherDetailViewController: Observer {
    func update() {
        sync()
    }
}

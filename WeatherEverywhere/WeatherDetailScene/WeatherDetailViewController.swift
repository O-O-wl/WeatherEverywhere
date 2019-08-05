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
    
    lazy var dailyWeatherController = DailyWeathersController(dailyWeathers: model.daily?.compactMap{ $0 } ?? [])
    
    lazy var hourlyWeatherController = HourlyWeathersController(hourlyWeathers: model.hourly?.compactMap{ $0 } ?? [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ModelStore.shared.register(self)
        sync()
        self.navigationController?.navigationBar.isHidden = true
        dailyWeathersTableView.dataSource = dailyWeatherController
        dailyWeathersTableView.delegate = dailyWeatherController
        hourlyWeathersCollectionView.dataSource = hourlyWeatherController
        hourlyWeathersCollectionView.delegate = hourlyWeatherController
    }
    
    func sync() {
        locationLabel.text = model.location?.description
        summaryLabel.text = model.current?.summary?.description
        currentTemperatureLabel.text = model.current?.temperature?.description
        wallpaperImageView.image = model.current?.wallPaper?.description
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
// Mark: - + Observer
extension WeatherDetailViewController: Observer {
    func update() {
        sync()
    }
    /// - Todo: 콜렉션 레이아웃 버그
    func test() {
        let layout = UICollectionViewFlowLayout()
        let side = self.hourlyWeathersCollectionView.frame.height
        layout.estimatedItemSize = CGSize(width: side, height: side)
        layout.scrollDirection = .horizontal
        self.hourlyWeathersCollectionView.collectionViewLayout = layout
    }
    
    
}

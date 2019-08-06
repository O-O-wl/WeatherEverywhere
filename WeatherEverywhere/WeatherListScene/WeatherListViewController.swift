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
    private var weathers : [WeatherListModelable] {
        return ModelStore.shared.getCurrentModels()
    }
    // MARK: - IBOutlets
    @IBOutlet weak var celsiusDegreeBarButton: UIButton!
    @IBOutlet weak var fahrenheitDegreeBarButton: UIButton!
    @IBOutlet weak var remainerView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.allowsSelectionDuringEditing = true
        ModelStore.shared.register(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         celsiusButtonDidTap(self)
        
    }
    
    // MARK: - IBActions
    @IBAction func celsiusButtonDidTap(_ sender: Any) {
        self.weathers.forEach {
            ($0.temperature as? Temperature)?.convert(to: .celsius)
        }
        self.tableView.reloadData()
    }
    
    @IBAction func fahrenheitButtonDidTap(_ sender: Any) {
        self.weathers.forEach {
            ($0.temperature as? Temperature)?.convert(to: .fahrenheit)
        }
        self.tableView.reloadData()
    }
    
}
// MARK: - DataSource
extension WeatherListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stateLabel.text = weathers.isEmpty ? "지역을 등록해주세요." : "⛅️"
        return weathers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let weatherCell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath) as? WeatherCell
            else { return WeatherCell() }
        weatherCell.sync(model: weathers[indexPath.row])
        return weatherCell
    }
}
// MARK: - Delegate
extension WeatherListController {
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isEditing = true
        ModelStore.shared.remove(at: indexPath.row)
    }
}
// MARK: - Segue Control
extension WeatherListController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? WeatherCell,
            let index = self.tableView.indexPath(for: cell),
            let next = segue.destination as? WeatherDetailViewController
            else { return }
        next.selectedIndex = index.row
    }
}
// MARK: - Obeserver
extension WeatherListController: Observer {
    func update() {
        self.tableView.reloadData()
    }
}

//
//  SearchResultDataSource.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

extension LocalSearcher: UITableViewDataSource {
    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionCell.reuseID, for: indexPath)
        guard let suggestionCell = cell as? SuggestionCell else { return cell }
        let row = indexPath.row

        let currentPlacemark = locals[row].placemark
        suggestionCell.textLabel?.text = currentPlacemark.address
        return suggestionCell
    }
    
}


//
//  LocalSearcher.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

class LocalSearcher: NSObject {
    
    var localSearch = MKLocalSearch.init(request: MKLocalSearch.Request())
    var locals = [MKMapItem]()

    func search(for query: String?, complete: (() -> Void)? = nil){
        guard query != nil else { return }
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        search(using: searchRequest, complete ?? {})
    }
    
    private func search(using request: MKLocalSearch.Request, _ complete: @escaping () -> Void){
        localSearch = MKLocalSearch(request: request)
        localSearch.start(completionHandler: {
            res, err in
            self.locals.removeAll()
            res?.mapItems.forEach{ self.locals.append($0) }
            complete()
        })
    }
}
extension LocalSearcher: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionCell.reuseID, for: indexPath)
        guard let suggestionCell = cell as? SuggestionCell else { return cell }
        let row = indexPath.row
        suggestionCell.textLabel?.text = locals[row].placemark.title
        return suggestionCell
    }
    
}

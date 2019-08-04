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

    func search(for query: String?, complete: (() -> Void)? = nil) {
        guard query != nil else { return }
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        search(using: searchRequest, complete ?? {})
    }
    
    private func search(using request: MKLocalSearch.Request, _ complete: @escaping () -> Void) {
        localSearch = MKLocalSearch(request: request)
        localSearch.start {
            res, err in
            guard let res = res else { return }
            self.locals.removeAll()
            self.locals.append(contentsOf: res.mapItems )
            complete()
        }
    }
}

extension MKPlacemark {
    
    var address: String? {
        let components = [ self.country, self.administrativeArea, self.locality, self.subLocality ]
        return components
            .compactMap { $0 }
            .joined(separator: " ")
    }
    
}

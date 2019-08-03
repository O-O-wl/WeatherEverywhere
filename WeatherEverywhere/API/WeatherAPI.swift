//
//  WeatherAPI.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit
import MapKit

struct WeatherAPI {
    static private let baseURL =  URL(string: "https://api.darksky.net/forecast")
    static private let apiKey = { Bundle.main.infoDictionary?["APIKey"] as? String ?? "" }()
    
    static func requestForecast(query: Queriable, completion: @escaping (ForcastDTO) -> Void ) {
        let reqURL = baseURL?.appendingPathComponent(apiKey).appendingPathComponent(query.toQuery())
        
        DispatchQueue.main.async {
            guard let data = try? Data(contentsOf: reqURL!) else { return }
            print(String(data: data,encoding: .utf8)!)
            let forcast = try! JSONDecoder().decode(ForcastDTO.self, from: data)
            completion(forcast)
        }
    }
}

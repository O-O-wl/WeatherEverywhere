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
    static private let baseURL =  URL(string: "https://api.darksky.net")!
    static private let apiKey = { Bundle.main.infoDictionary?["APIKey"] as? String ?? "" }()
    
    static func requestForecast(queriable: Queriable, completion: @escaping (ForcastDTO) -> Void ) {
        DispatchQueue.main.async {
            guard
                let url = makeURL(query: queriable.toQuery()),
                let data = try? Data(contentsOf: url),
                let forcast = try? JSONDecoder().decode(ForcastDTO.self, from: data)
                else {
                    assertionFailure("JSON 데이터 로드 실패")
                    return }
            
            completion(forcast)
        }
    }
    
    /// - Todo:
    private static func makeURL(query: String) -> URL? {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        urlComponents?.path = "/forecast/\(apiKey)/\(query)"
        
        urlComponents?.queryItems = [URLQueryItem(name: "lang", value: "ko"),URLQueryItem(name: "si", value: "temperature")]
        return urlComponents?.url
    }
}

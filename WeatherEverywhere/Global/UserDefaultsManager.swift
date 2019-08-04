//
//  File.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    private static let saveKey = "locations"
    
    // MARK: - Methods
    private init() {}
    
    static func load() -> [LocationModel] {
        guard
            let loadedData = UserDefaults.standard.data(forKey: saveKey),
            let models = try? PropertyListDecoder().decode([LocationModel].self, from: loadedData)
            else { return [] }
        return models
    }
    
    static func save(models: [LocationModel]) {
        let savingData = try? PropertyListEncoder().encode(models)
        UserDefaults.standard.set(savingData, forKey: saveKey)
        UserDefaults.standard.synchronize()
    }
    
}

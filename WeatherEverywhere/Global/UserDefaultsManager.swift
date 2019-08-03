//
//  File.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

// MARK: - SingleTone
class UserDefaultsManager {
    
    private static let saveKey = "locations"
    
    // MARK: - Methods
    private init() {}
    
    static func load() -> [LocationModel]? {
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let loadedModels = try? PropertyListDecoder().decode([LocationModel].self, from: data)
            else { return nil }
        return loadedModels
    }
    
    static func save(models: [LocationModel]) {
        let dataToSave = try? PropertyListEncoder().encode(models)
        UserDefaults.standard.set(dataToSave, forKey: saveKey)
        UserDefaults.standard.synchronize()
    }
    
}

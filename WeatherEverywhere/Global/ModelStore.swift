//
//  ModelStore.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

// MARK: - Storeable
protocol Saveable { }

// MARK: - ModelStoreable
protocol ModelStoreable: class {
    associatedtype Model: TotalModelable
    
    var isEmpty: Bool { get }
    
    func store(_: Model?)
    func count() -> Int
    func remove(at: Int)
    
}

// MARK: - ModelStore
class ModelStore {
    
    // MARK: - Properties
    static var shared = ModelStore()
    private var models = [ForcastModelable]()
    
    public var isEmpty: Bool { return count() <= 0 }
    
    // MARK: - Methods
    private init() {}
    
    func store(_ model: ForcastModelable?) {
        guard let model = model else { return }
        models.append(model)
    }
    
    func getAll() -> [ForcastModelable] {
        return models
    }
    
    func count() -> Int {
        return models.count
    }
    
    func remove(at index: Int) {
        models.remove(at: index)
    }
    
}

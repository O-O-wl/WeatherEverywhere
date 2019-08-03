//
//  ModelStore.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

protocol Modelable { }

protocol ModelStoreable : class {
    associatedtype Model: Modelable
    
    func store(_: Model)
    func count() -> Int
    func remove(at: Int)
    
}


class ModelStore: ModelStoreable {
    
    typealias Model = WeatherDetailModel
    
    // MARK: - Properties
    static var shared = ModelStore()
    
    private var models = [Model]()
    
    // MARK: - Methods
    private init() {}
    
    func store(_ model: Model) {
        models.append(model)
    }
    
    func count() -> Int {
        return models.count
    }
    
    func remove(at index: Int) {
        models.remove(at: index)
    }
    
}

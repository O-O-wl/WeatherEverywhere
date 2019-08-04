//
//  ModelStore.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 04/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation

protocol Storeable { }

protocol ModelStoreable : class {
    associatedtype Model: Storeable
    
    func store(_: Model?)
    func count() -> Int
    func remove(at: Int)
    
}


//class ModelStore: ModelStoreable {
//    
//    typealias Model = WeatherDetailModel
//    
//    // MARK: - Properties
//    static var shared = ModelStore()
//    public var isEmpty: Bool { return count() <= 0 }
//    private var models = [Model]()
//    
//    // MARK: - Methods
//    private init() {}
//    
//    func store(_ model: Model?) {
//        guard let model = model else { return }
//        models.append(model)
//    }
//    
//    func count() -> Int {
//        return models.count
//    }
//    
//    func remove(at index: Int) {
//        models.remove(at: index)
//    }
//    
//}

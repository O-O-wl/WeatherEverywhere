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
protocol ModelStoreable: NSObject {
    associatedtype Model: TotalModelable
    
    var isEmpty: Bool { get }
    func store(_: Model?)
    func count() -> Int
    func remove(at: Int)
    
}

protocol Subject: NSObject {
    func register(_ observer: Observer)
    func remove(_ observer: Observer);
    func notify();
}

protocol Observer: NSObject {
    func update()
}

// MARK: - ModelStore
class ModelStore: NSObject {
    
    // MARK: - Properties
    static var shared = ModelStore()
    private var models = [ForcastModelable]()
    private var observers = [Observer]()
    
    public var isEmpty: Bool { return count() <= 0 }
    
    // MARK: - Methods
    private override init() {
        super.init()
    }
    
    func store(_ model: ForcastModelable?) {
        guard let model = model else { return }
        models.append(model)
        notify()
    }
    
    func getCurrentModels() -> [CurrentWeatherModelable] {
        return models.compactMap { $0.current }
    }
    
    func getForcastModels(at index: Int) -> ForcastModelable {
        return models[index]
    }
    
    func count() -> Int {
        return models.count
    }
    
    func remove(at index: Int) {
        models.remove(at: index)
        notify()
    }
    
    func load() {
        ModelStore.shared.models.removeAll()
        print("Update")
        UserDefaultsManager.setUp(complete: {
            location in
            WeatherAPI.request(queriable: location) {
                dto in
                let model = DTOParser.parse(apiDTO: dto, title: location.description)
                ModelStore.shared.store(model)
            }
        })
    }
    
    @objc func update() {
        print("=============================")
        print("             업데이트")
        print("=============================")
        
        for index in 0..<models.count {
            guard let location = models[index].location else { return }
            WeatherAPI.request(queriable: location) {
                dto in
                self.models[index] = DTOParser.parse(apiDTO: dto, title: location.description )
                self.notify()
            }
        }
    }
    
    
}
// MARK: - Subject
extension ModelStore: Subject {
    
    func register(_ observer: Observer) {
        observers.append(observer)
    }
    
    func remove(_ observer: Observer) {
        observers.removeAll{ $0 == observer }
    }
    
    func notify() {
        observers.forEach { $0.update() }
    }
}


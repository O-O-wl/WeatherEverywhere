//
//  AppDelegate.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 01/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static var forcastDTO: ApiDTO = { ApiDTO.init(latitude: 37.01, longitude: 127.01, timezone: "Asia/Seoul", currently: weatherDTO, hourly: WeathersDTO.init(data: [weatherDTO]), daily: WeathersDTO.init(data: [weatherDTO])) }()
    
    static let weatherDTO: WeatherDTO = { WeatherDTO.init(icon: .rain, time: 1509993277, summary: "맑음", sunriseTime: 1509993277, sunsetTime: 1509993277, precipIntensity: 10, precipProbability: 0.8, humidity: 0.7, pressure: 1015, windSpeed: 3, windBearing: 360, uvIndex: 1, visibility: 9.7, temperature: 36.6, apparentTemperature: 40.5, temperatureMin: 22, temperatureMax: 49) } ()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let model = DTOParser.parse(apiDTO: AppDelegate.forcastDTO, title: "서울 특별시")
        ModelStore.shared.store(model)
        (self.window?.rootViewController as? WeatherListController)?.tableView.reloadData()
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
//        let loaded = UserDefaultsManager.load()
//        loaded.forEach {
//            local in
//            WeatherAPI.request(queriable: local) {
//                let model = DTOParser.parse(apiDTO: $0, title: local.description)
//                ModelStore.shared.store(model as? ModelStore.Model)
//                print(ModelStore.shared.count())
//            }
//        } 
//        if (!loaded.isEmpty) {
//            WeatherAPI.requestForecast(queriables: loaded, completion: { ModelStore.shared.store( Parser.parse(forcastDTO:$0, title: )) })
//        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


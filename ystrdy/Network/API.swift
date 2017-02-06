//
//  API.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Alamofire


struct API {
    
    static func getCurrentWeatherForLocation(_ location: CGPoint) -> Observable<CurrentTemp> {
        return Observable.create { observer -> Disposable in
            Alamofire.request(WeatherUndergroundRouter.getCurrentWeatherForLocation(location)).responseObject(completionHandler: { (response: DataResponse<CurrentTemp>) in
                if let results = response.result.value {
                    observer.on(.next(results))
                    observer.on(.completed)
                }
           })
            return Disposables.create()
        }
    }
    
    static func getYesterdaysWeatherForLocation(_ location: CGPoint) -> Observable<YesterdayTemp> {
        return Observable.create { observer -> Disposable in
            Alamofire.request(WeatherUndergroundRouter.getYesterdaysWeatherForLocation(location)).responseObject(completionHandler: { (response: DataResponse<YesterdayTemp>) in
                if let results = response.result.value {
                    observer.on(.next(results))
                    observer.on(.completed)
                }
           })
            return Disposables.create()
        }
    }
}

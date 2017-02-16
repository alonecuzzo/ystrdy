//
//  TemperatureViewModel.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/16/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import RxSwift

struct TemperatureDifference {
    let location: Location
    let yesterdayTemp: TemperatureType
    let todayTemp: TemperatureType
}

struct TemperatureDeltaViewModel {
    
    //MARK: Property
    let delta: Variable<TemperatureDifference?> = Variable(nil)
    let disposeBag = DisposeBag()
    
    
    //MARK: Method
    func updateWeatherDifferenceForLocation(_ location: LocationCoordinate) {
        Observable.combineLatest(API.getYesterdaysWeatherForLocation(location), API.getCurrentWeatherForLocation(location), API.getLocationDataForLocation(location)) { yesterdayTemp, currentTemp, locationData in
                return TemperatureDifference(location: locationData, yesterdayTemp: yesterdayTemp, todayTemp: currentTemp)
            }.subscribe(onNext: { delta in
                self.delta.value = delta
        }).addDisposableTo(disposeBag)
    }
}

//
//  WeatherDifferenceViewModel.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


class WeatherDifferenceViewModel {
    
    //MARK: Property
    let weatherDelta = Variable("")
    let disposeBag = DisposeBag()
    
    
    //MARK: Method
    func updateWeatherDifferenceForLocation(_ location: CGPoint) {
        Observable.combineLatest(API.getYesterdaysWeatherForLocation(location), API.getCurrentWeatherForLocation(location)) { $1.tempF - $0.tempF }.subscribe(onNext: { delta in
            self.weatherDelta.value = "\(delta)"
        }).addDisposableTo(disposeBag)
    }
}

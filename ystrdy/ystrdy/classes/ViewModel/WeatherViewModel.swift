//
//  WeatherViewModel.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject {
    
    //MARK: Props
    
    let executeSearch: RACCommand!
    let services: ViewModelServices
    
    private var yesterdayTemp = Double.infinity
    private var todayTemp = Double.infinity
    
    var location :CLLocation?
    
    var locationString :String {
        get {
            if let location = location {
                return "lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)"
            } else {
                return ""
            }
        }
    }
    
    var cityName = ""
    
    var tempDifference :Double {
        get {
            return self.todayTemp - self.yesterdayTemp
        }
    }
    
    init(services: ViewModelServices) {
        
        self.services = services
        
        super.init()
        
        executeSearch = RACCommand() {
            (any: AnyObject!) -> RACSignal in
            return self.searchSignal()
        }
    }
    
    func searchSignal() -> RACSignal {
        return RACSignal.combineLatest([self.executeYesterdaysWeatherSearchSignal(), self.executeTodaysWeatherSearchSignal()])
    }
    
    //MARK: Privates
    
    private func executeTodaysWeatherSearchSignal() -> RACSignal {
        return services.weatherSearchService.weatherCurrentSearchSignal(self.cityName).doNextAs {
            (w :WeatherModel) -> () in
            self.todayTemp = w.weather.temp
        }
    }
    
    private func executeYesterdaysWeatherSearchSignal() -> RACSignal {
        return self.services.weatherSearchService.weatherHistoricalSearchSignal(self.cityName).doNextAs {
            (w :WeatherModel) -> () in
            self.yesterdayTemp = w.weather.temp
        }
    }
}
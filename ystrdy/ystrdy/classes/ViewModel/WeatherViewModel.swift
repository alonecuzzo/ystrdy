//
//  WeatherViewModel.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

class WeatherViewModel: NSObject {
    
    //MARK: Props
    
    dynamic var weather :WeatherSearchResult!
    
    let executeSearch: RACCommand!
    let services: ViewModelServices
    
    //city name property?
    dynamic var cityName = ""
    
    init(services: ViewModelServices) {
        
        self.services = services
        
        super.init()
        
        executeSearch = RACCommand() {
            (any: AnyObject!) -> RACSignal in
            return RACSignal.combineLatest([self.executeTodaysWeatherSearchSignal(), self.executeYesterdaysWeatherSearchSignal()])
        }
        
        //need to set up a watcher for the weather result
    }
    
    //MARK: Privates
    
    private func executeTodaysWeatherSearchSignal() -> RACSignal {
        var todaysWeather :WeatherModel?
        return services.weatherSearchService.weatherCurrentSearchSignal(self.cityName).doNextAs {
            (tw :WeatherModel) -> () in
            todaysWeather = tw
            let weather = todaysWeather?.weather
            println("HI \(weather?.temp)")
        }
    }
    
    private func executeYesterdaysWeatherSearchSignal() -> RACSignal {
        var yesterdaysWeather :WeatherModel?
        return self.services.weatherSearchService.weatherHistoricalSearchSignal(self.cityName).doNextAs {
            (yw :WeatherModel) -> () in
            yesterdaysWeather = yw
            let yesterday = yesterdaysWeather?.weather
            println("YSTERDAY \(yesterday?.temp)")
        }
    }
}
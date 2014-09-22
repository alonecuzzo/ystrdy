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
            return self.executeSearchSignal()
        }
        
        //need to set up a watcher for the weather result
    }
    
    //MARK: Privates
    
    private func executeSearchSignal() -> RACSignal {
        var todaysWeather :Weather?
        var yesterdaysWeather :Weather?
        return services.weatherSearchService.weatherCurrentSearchSignal(self.cityName).doNextAs {
            (tw :Weather) -> () in
            todaysWeather = tw
            println("HI \(tw.maxFarenheit)")
//            self.services.weatherSearchService.weatherHistoricalSearchSignal(self.cityName).doNextAs {
//                (yw :Weather) -> () in
//                yesterdaysWeather = yw
//                self.weather = WeatherSearchResult(todaysWeather: todaysWeather!, yesterdaysWeather: yesterdaysWeather!)
//                //we want the view to be updated here somehow
//            }
        }
    }
}
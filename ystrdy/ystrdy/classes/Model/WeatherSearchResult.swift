//
//  WeatherSearchResult.swift
//  ystrdy
//
//  Created by Jabari on 9/14/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

class WeatherSearchResult :NSObject {
    
    let todaysWeather :Weather
    let yesterdaysWeather :Weather
    
    init(todaysWeather :Weather, yesterdaysWeather :Weather) {
        self.todaysWeather = todaysWeather
        self.yesterdaysWeather = yesterdaysWeather
        super.init()
    }
}

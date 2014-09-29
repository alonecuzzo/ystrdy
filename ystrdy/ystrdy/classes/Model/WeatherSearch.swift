//
//  WeatherSearch.swift
//  ystrdy
//
//  Created by Jabari on 9/14/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

protocol WeatherSearch {
    
    //searches for the current weather of wherever the user is... not sure of the params that we need to pass up yet, for now we'll just use city name
    func weatherCurrentSearchSignal(cityName: String) -> RACSignal
    
    //returns the weather data for the location from yesterday, not sure if it needs a city name/ location since we'll be using the location from the first function?
    func weatherHistoricalSearchSignal(cityName: String) -> RACSignal
}

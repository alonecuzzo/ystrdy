//
//  Weather.swift
//  ystrdy
//
//  Created by Jabari on 9/14/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

struct Weather : JSONDecode {
    
    let temp: Double
    
    typealias J = Weather
    static func fromJSON(j: JSValue) -> J? {
        switch j {
            case let .JSObject(d):
                let temp = d["temp"] >>= JSDouble.fromJSON ||= 0
                return Weather(temp: temp)
            default:
                println("Expected to be passed a type object")
                return nil
        }
    }
}

//going to use this to wrap our structs... can't pass stuff around that's not any object which seems dumb
class WeatherModel : NSObject {
    let weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
        super.init()
    }
}

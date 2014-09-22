//
//  WeatherSearchImp.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import UIKit

class WeatherSearchImp: NSObject, WeatherSearch {
    
    //MARK: properties
    let APIKey = "b22cafbf884cf6f6ff7f56cbe1f4c20a"
    let BaseURL = "http://api.openweathermap.org/data/2.5/"
    let CurrentWeatherEndPoint = "weather?q="
    let HistoricalWeatherEndPoint = ""
    
    var CurrentWeatherURLString :String {
        return self.BaseURL + self.CurrentWeatherEndPoint
    }
    
    var HistoricalWeatherURLString :String {
        return self.BaseURL + self.HistoricalWeatherEndPoint
    }
    
    //MARK: init
    override init() {
        super.init()
    }
    
    //MARK: WeatherSearch protocol stuff
    func weatherCurrentSearchSignal(cityName: String) -> RACSignal {
        let url = NSURL(string: CurrentWeatherURLString + cityName)
        return self.getCurrentWeatherForURL(url);
    }
    
    func weatherHistoricalSearchSignal(cityName: String) -> RACSignal {
        let url = NSURL(string: HistoricalWeatherURLString + cityName)
        return self.getHistoricalWeatherForURL(url)
    }
    
    //MARK: Privates
    private func getCurrentWeatherForURL(url :NSURL) -> RACSignal {
        let request = NSURLRequest(URL: url)
        return NSURLConnection.rac_sendAsynchronousRequest(request).mapAs({
            (x: RACTuple) -> Weather in
            let json: AnyObject = NSJSONSerialization.JSONObjectWithData(x.second as NSData, options: nil, error: nil)!
            return self.parseWeatherObjectFromJSON(json as String)
        })
    }
    
    private func getHistoricalWeatherForURL(url :NSURL) -> RACSignal {
//        let request = NSURLRequest(URL: url)
//        return NSURLConnection.ystrdy_sendAsynchronously(request).mapAs({
//            (tuple: ystrdy_RACTuple) -> AnyObject in
//            
//            return RACSignal.empty()
//        })
        return RACSignal.empty()
    }
    
    private func parseWeatherObjectFromJSON(json :String) -> Weather {
        //parse that stuffs here!
    }
   
}

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
    let HistoricalWeatherEndPoint = "history/city?q="
    
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
        println("url \(url.absoluteString!)")
        return NSURLConnection.rac_sendAsynchronousRequest(request).mapAs({
            (x: RACTuple) -> WeatherModel in
            //how to dispatch an error if we get a nil model?
            let weatherModel = WeatherModel(weather: self.parseWeatherObjectFromJSON(x.second as NSData)!)
            return weatherModel
        })
    }
    
    private func getHistoricalWeatherForURL(url :NSURL) -> RACSignal {
        let request = NSURLRequest(URL: url)
        println("historical url \(url.absoluteString!)")
        return NSURLConnection.rac_sendAsynchronousRequest(request).mapAs({
            (x: RACTuple) -> WeatherModel in
            let weatherModel = WeatherModel(weather: self.parseHistoricalWeatherObjectFromJSON(x.second as NSData)!)
            return weatherModel
        })
    }
    
    private func parseHistoricalWeatherObjectFromJSON(data: NSData) -> Weather? {
        if let json = JSValue.decode(data) {
            switch json {
                case let .JSObject(d):
                    let list: JSValue? = d["list"]
                    if let list = list {
                        switch list {
                            case let .JSArray(a):
                                //silly code, works for now but we need error handling all over the place!
                                switch a[0] {
                                    case let .JSObject(e):
                                        let main: JSValue? = e["main"]
                                        if let weatherDict = main {
                                            return Weather.fromJSON(weatherDict)
                                        } else {
                                            println("couldn't find weather object")
                                            return nil
                                    }
                                    default:
                                        return nil
                                }
                        default:
                            println("couldn't find list array")
                        }
                    }
                default:
                    println("couldn't parse object")
                    return nil
            }
        }
        println("couldn't even decode historical weather object")
        return nil
    }
    
    private func parseWeatherObjectFromJSON(data: NSData) -> Weather? {
        if let json = JSValue.decode(data) {
            switch json {
                case let .JSObject(d):
                    let main: JSValue? = d["main"]
                    if let weatherDict = main {
                        return Weather.fromJSON(weatherDict)
                    } else {
                        println("couldn't find weather object")
                        return nil
                    }
                default:
                    println("couldn't parse from first object in array")
                    return nil
            }
        }
        println("couldn't even decode")
        return nil
    }
}
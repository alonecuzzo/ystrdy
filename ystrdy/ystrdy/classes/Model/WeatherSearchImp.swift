//
//  WeatherSearchImp.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import UIKit

class WeatherSearchImp: NSObject {
    
    //MARK: properties
    
    let apiKey = "b22cafbf884cf6f6ff7f56cbe1f4c20a"
    
    //MARK: init
    override init() {
        
        
        
        super.init()
        
        getWeatherData().subscribeNextAs {
            (anyObject: AnyObject) -> () in
            println("got some datat")
        }
        
    }
    
    
    //MARK: Get
    
    func getWeatherData() -> RACSignal {
        let request = NSURLRequest(URL: NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=London"))
        return NSURLConnection.ystrdy_sendAsynchronously(request).mapAs({
            (x: ystrdy_RACTuple) -> AnyObject in
            
            println("REQUEST \(request)")
            let json = NSJSONSerialization.JSONObjectWithData(x.data, options: nil, error: nil)
            println("Data \(json)")
            
            return RACSignal.empty()
        })
    }
   
}

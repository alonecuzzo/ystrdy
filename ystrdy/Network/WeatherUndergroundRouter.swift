//
//  WeatherUndergroundRouter.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import Alamofire


//looks like we'll have to add a call to this endpoint: http://api.wunderground.com/api/9caa09c5d1399971/geolookup/q/37.776289,-122.395234.json

//there's a "city" key which tells you if its a us city or not

//here are the docs: https://www.wunderground.com/weather/api/d/docs?d=data/geolookup


enum WeatherUndergroundRouter: URLRequestConvertible {
    
    //MARK: Case
    case getCurrentWeatherForLocation(LocationCoordinate), getYesterdaysWeatherForLocation(LocationCoordinate), getLocationDataForLocation(LocationCoordinate)
    
    
    //MARK: Property
    private static let baseURLString = "http://api.wunderground.com/api/9caa09c5d1399971/"
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getCurrentWeatherForLocation(_):
            return "conditions"
        case .getYesterdaysWeatherForLocation(_):
            return "yesterday"
        case .getLocationDataForLocation(_):
            return "geolookup"
        }
    }
    
    
    //MARK: Method
    func asURLRequest() throws -> URLRequest {
        
        let url = try WeatherUndergroundRouter.baseURLString.asURL()
        let urlWithPath = url.appendingPathComponent(path)
        let urlWithQ = urlWithPath.appendingPathComponent("q")
        var finalURL: URL? = nil
        
        switch self {
        case let .getYesterdaysWeatherForLocation(location), let .getCurrentWeatherForLocation(location), let .getLocationDataForLocation(location):
            finalURL = urlWithQ.appendingPathComponent("\(location.longitude),\(location.latitude).json")
        }
        
        var urlRequest = URLRequest(url: finalURL!)
        urlRequest.httpMethod = method.rawValue
        
        //        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}

//
//  WeatherUndergroundRouter.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


enum WeatherUndergroundRouter: URLRequestConvertible {
    
    //MARK: Case
    case getCurrentWeatherForLocation(CGPoint), getYesterdaysWeatherForLocation(CGPoint)
    
    
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
        }
    }
    
    
    //MARK: Method
    func asURLRequest() throws -> URLRequest {
        
        let url = try WeatherUndergroundRouter.baseURLString.asURL()
        let urlWithPath = url.appendingPathComponent(path)
        let urlWithQ = urlWithPath.appendingPathComponent("q")
        var finalURL: URL? = nil
        
        switch self {
        case let .getYesterdaysWeatherForLocation(location), let .getCurrentWeatherForLocation(location):
            finalURL = urlWithQ.appendingPathComponent("\(location.x),\(location.y).json")
        }
        
        var urlRequest = URLRequest(url: finalURL!)
        urlRequest.httpMethod = method.rawValue
        
        //        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}

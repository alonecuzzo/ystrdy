//
//  ViewController.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/4/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nycCoordinates = CGPoint(x: 40.712784, y: -74.005941)
        API.getCurrentWeatherForLocation(nycCoordinates)
    }
}

struct API {
    static func getCurrentWeatherForLocation(_ location: CGPoint) {
       Alamofire.request(WeatherUndergroundRouter.getCurrentWeatherForLocation(location)).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

enum WeatherUndergroundRouter: URLRequestConvertible {
    
    case getCurrentWeatherForLocation(CGPoint), getYesterdaysWeatherForLocation(CGPoint)
    
    private static let baseURLString = "http://api.wunderground.com/api/9caa09c5d1399971/"
    
    
    //for historical: dailysummary - 1st object - meantempi
    
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getCurrentWeatherForLocation(_):
            return "conditions" //"current_observation" -> temp_f
        case .getYesterdaysWeatherForLocation(_):
            return "yesterday"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        //http://api.wunderground.com/api/9caa09c5d1399971/conditions/q/40.712784,-74.005941.json
        let url = try WeatherUndergroundRouter.baseURLString.asURL()
        let urlWithPath = url.appendingPathComponent(path)
        let urlWithQ = urlWithPath.appendingPathComponent("q")
        var finalURL: URL? = nil
        
        switch self {
        case let .getYesterdaysWeatherForLocation(location):
            finalURL = urlWithQ.appendingPathComponent("\(location.x),\(location.y).json")
        case let .getCurrentWeatherForLocation(location):
            finalURL = urlWithQ.appendingPathComponent("\(location.x),\(location.y).json")
        }
        
        var urlRequest = URLRequest(url: finalURL!)
        urlRequest.httpMethod = method.rawValue
        
        
        print("url: \(urlRequest.url?.absoluteString)")
//        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}

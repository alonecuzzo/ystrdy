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
       Alamofire.request(OpenWeatherRouter.getCurrentWeatherForLocation(location)).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

enum OpenWeatherRouter: URLRequestConvertible {
    case getCurrentWeatherForLocation(CGPoint)
    
    private static let baseURLString = "http://api.openweathermap.org/data/2.5/"
    private static let APPID = "&APPID=b22cafbf884cf6f6ff7f56cbe1f4c20a"
    
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getCurrentWeatherForLocation(_):
            return "weather"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try OpenWeatherRouter.baseURLString.asURL()
        let urlWithPath = url.appendingPathComponent(path)
        var params = ["APPID": "b22cafbf884cf6f6ff7f56cbe1f4c20a"]
        
        var urlRequest = URLRequest(url: urlWithPath)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .getCurrentWeatherForLocation(location):
            params["lat"] = "\(location.x)"
            params["lon"] = "\(location.y)"
        }
        
        print("url: \(urlRequest.url?.absoluteString)")
        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        return urlRequest
    }
}

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
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nycCoordinates = CGPoint(x: 40.712784, y: -74.005941)
        API.getCurrentWeatherForLocation(nycCoordinates).subscribe(onNext: { temp in
            print("temp obj: \(temp)")
        }).addDisposableTo(disposeBag)
//        API.getYesterdaysWeatherForLocation(nycCoordinates)
    }
}

class WeatherDifferenceViewModel {
    //get the difference - fires both api calls and returns with difference
    
    let weatherDelta = Variable(0.0)
    
    func updateWeatherDifferenceForLocation(location: CGPoint) {
       //cool now we make the calls... wait for both to come back then update!
    }
}

struct API {
    
    
    
    static func getCurrentWeatherForLocation(_ location: CGPoint) -> Observable<CurrentTemp> {
        return Observable.create { observer -> Disposable in
            Alamofire.request(WeatherUndergroundRouter.getCurrentWeatherForLocation(location)).responseObject(completionHandler: { (response: DataResponse<CurrentTemp>) in
                if let results = response.result.value {
                    observer.on(.next(results))
                    observer.on(.completed)
                }
           })
            return Disposables.create()
        }
    }
    
    static func getYesterdaysWeatherForLocation(_ location: CGPoint) {
       Alamofire.request(WeatherUndergroundRouter.getYesterdaysWeatherForLocation(location)).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
//    static func getContentResultsForSection(_ sectionID: Int) -> Observable<[ContentResult]> {
//        return Observable.create { observer -> Disposable in
//            Alamofire.request(Router.getCategoryContent(sectionID)).responseCollection(completionHandler: { (response: DataResponse<[ContentResult]>) in
//                if let results  = response.result.value {
//                    observer.on(.next(results))
//                    observer.on(.completed)
//                }
//            })
//            return Disposables.create()
//        }
//    }
}

struct CurrentTemp {
    let tempF: CGFloat
}

extension CurrentTemp: ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any) {
        guard let innerRepresentation = representation as? [String: Any],
        let currentObs = innerRepresentation["current_observation"] as? [String: Any],
        let tempF = currentObs["temp_f"] as? CGFloat
        else {
           return nil
        }
        self.tempF = tempF
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

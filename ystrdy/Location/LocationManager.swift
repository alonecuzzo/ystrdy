//
//  LocationManager.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/20/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift


//http://nshipster.com/core-location-in-ios-8/ for pattern

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    //MARK: - Property
    let location = Variable(LocationCoordinate(latitude: 0, longitude: 0))
    private let locationManager = CLLocationManager()
    private let disposeBag = DisposeBag()
    
    func getLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location.value = LocationCoordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            //ask for them to cut permissions on http://nshipster.com/core-location-in-ios-8/
            break
        default:
            break
        }
    }
}

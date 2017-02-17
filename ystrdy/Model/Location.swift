//
//  Location.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/16/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation


struct Location {
    let coordinate: LocationCoordinate
    let locationType: LocationType
    let cityName: String
    let stateName: String
    let countryName: String
}


extension Location: ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any) {
        guard let innerRepresentation = representation as? [String: Any],
        let location = innerRepresentation["location"] as? [String: Any],
        let cityType = location["type"] as? String,
        let lat = location["lat"] as? String,
        let lon = location["lon"] as? String,
        let latDouble = Double(lat),
        let lonDouble = Double(lon),
        let city = location["city"] as? String,
        let state = location["state"] as? String,
        let country = location["country_name"] as? String else { return nil }
        self.coordinate = LocationCoordinate(latitude: latDouble, longitude: lonDouble)
        self.locationType = LocationType.locationTypeForString(cityType)
        self.cityName = city
        self.stateName = state
        self.countryName = country
    }
}

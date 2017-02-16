//
//  LocationType.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/16/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation


enum LocationType {
    case national, international, none
    
    static func locationTypeForString(_ string: String) -> LocationType {
        switch string {
        case "INTLCITY":
            return .international
        case "CITY":
            return .national
        default:
            return .none
        }
    }
}

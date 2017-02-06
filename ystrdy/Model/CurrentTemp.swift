//
//  CurrentTemp.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit


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

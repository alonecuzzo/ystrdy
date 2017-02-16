//
//  YesterdayTemp.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation


struct YesterdayTemp: TemperatureType {
    var tempF: Double
}


extension YesterdayTemp: ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any) {
        guard let innerRepresentation = representation as? [String: Any],
            let history = innerRepresentation["history"] as? [String: Any],
            let summary = history["observations"] as? [Any],
            let summaryObj = summary.first as? [String: Any],
            let tempFString = summaryObj["tempi"] as? String
            else {
                return nil
        }
        
        let n = NumberFormatter().number(from: tempFString)!
        self.tempF = Double(n)
    }
}

//
//  YesterdayTemp.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit


struct YesterdayTemp {
    let tempF: CGFloat
}


extension YesterdayTemp: ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any) {
        guard let innerRepresentation = representation as? [String: Any],
            let history = innerRepresentation["history"] as? [String: Any],
            let summary = history["dailysummary"] as? [Any],
            let summaryObj = summary.first as? [String: Any],
            let tempFString = summaryObj["meantempi"] as? String
            else {
                return nil
        }
        
        let n = NumberFormatter().number(from: tempFString)!
        self.tempF = CGFloat(n)
    }
}

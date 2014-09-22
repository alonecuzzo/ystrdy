//
//  Weather.swift
//  ystrdy
//
//  Created by Jabari on 9/14/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

class Weather {
    
    let date: NSDate
    let maxFarenheit: Float
    let minFarenheit: Float
    
    init (date: NSDate, maxFarenheit: Float, minFarenheit: Float) {
        self.date = date
        self.maxFarenheit = maxFarenheit
        self.minFarenheit = minFarenheit
    }
}

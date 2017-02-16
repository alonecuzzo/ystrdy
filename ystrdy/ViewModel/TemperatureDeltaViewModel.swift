//
//  TemperatureViewModel.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/16/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import RxSwift
import UIKit


struct TemperatureDeltaModel {
    let temperatureDelta: Int
    let yesterdayTemperature: Int
    let todayTemperature: Int
    let locationName: String
}

struct TemperatureDeltaViewModel {
    
    //MARK: Property
    let delta: Variable<TemperatureDeltaModel?> = Variable(nil)
    
    
    //MARK: Method
    func updateWeatherDifferenceForLocation(_ location: CGPoint) {
        //make api call and then do conversion here
    }
}

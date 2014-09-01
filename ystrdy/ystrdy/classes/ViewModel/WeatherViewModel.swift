//
//  WeatherViewModel.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

class WeatherViewModel: NSObject {
    
    //this should contain all of our business logic
    //our init will have a viewmodel service
    let services: ViewModelServices
    
    init(services: ViewModelServices) {
        self.services = services
        super.init()
    }

}

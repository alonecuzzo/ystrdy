//
//  ViewModelServicesImp.swift
//  ystrdy
//
//  Created by Jabari on 9/14/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

class ViewModelServicesImp: ViewModelServices {
    
    let weatherSearchService: WeatherSearch
    
    //need a reference to the viewController?
    init() {
       self.weatherSearchService = WeatherSearchImp()
    }
    
    //here is where we update the view
    //maybe send out some sort of notification?
    func pushViewModel(viewModel: AnyObject) {
        
    }
}
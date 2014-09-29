//
//  ViewModelService.swift
//  ystrdy
//
//  Created by Jabari on 8/31/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import Foundation

protocol ViewModelServices {
    
    func pushViewModel(viewModel: AnyObject)
    
    //here's the search api
    var weatherSearchService :WeatherSearch { get }
}

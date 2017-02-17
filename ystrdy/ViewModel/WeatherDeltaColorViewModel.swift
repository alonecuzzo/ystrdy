//
//  WeatherDeltaColorViewModel.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit


/// Returns color based on a delta 
struct WeatherDeltaColorViewModel {
    static func colorForDelta(_ delta: Int) -> UIColor {
        if delta > 0 {
            return UIColor.ystrdyWarm()
        } else if delta < 0 {
            return UIColor.ystrdyCool()
        }
        return .white //need neutral color
    }
}

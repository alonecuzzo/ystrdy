//
//  WeatherDeltaColorViewModel.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/6/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import Foundation
import UIKit


struct WeatherDeltaColorViewModel {
    static func colorForDelta(_ deltaString: String) -> UIColor? {
        guard let delta = Int(deltaString) else { return nil }
        if delta > 0 {
            return UIColor.ystrdyWarm()
        } else if delta < 0 {
            return UIColor.ystrdyCool()
        }
        return .white //need neutral color
    }
}

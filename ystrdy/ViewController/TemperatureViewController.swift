//
//  ViewController.swift
//  ystrdy
//
//  Created by Jabari Bell on 2/4/17.
//  Copyright © 2017 theowl. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import SnapKit


class TemperatureViewController: UIViewController {
    
    //MARK: Property
    private let disposeBag = DisposeBag()
    
    override var prefersStatusBarHidden: Bool { return true }
    

    //MARK: Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.ystrdyDarkPurple()
        
        let nycCoordinates = LocationCoordinate(latitude: -74.005941, longitude: 40.712784)
        
        let ovm = TemperatureDeltaViewModel()
        ovm.updateWeatherDifferenceForLocation(nycCoordinates)
        
        let deltaLabel = UILabel(frame: .zero)
        deltaLabel.font = UIFont.ralewayExtraLightFontWithSize(100)
        deltaLabel.textAlignment = .center
        deltaLabel.text = "loading"
        deltaLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(deltaLabel)
        deltaLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(32)
        }
        
        let inset = 40
        
        let yesterdayTempLabel = UILabel(frame: .zero)
        yesterdayTempLabel.font = UIFont.ralewayExtraLightFontWithSize(48)
        yesterdayTempLabel.textAlignment = .center
        yesterdayTempLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(yesterdayTempLabel)
        yesterdayTempLabel.snp.makeConstraints { make in
            make.left.equalTo(inset)
            make.top.equalTo(250)
        }
        
        let todayTempLabel = UILabel(frame: .zero)
        todayTempLabel.font = UIFont.ralewayExtraLightFontWithSize(48)
        todayTempLabel.textAlignment = .center
        todayTempLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(todayTempLabel)
        todayTempLabel.snp.makeConstraints { make in
            make.right.equalTo(-inset)
            make.top.equalTo(250)
        }
        
        let locationLabel = UILabel(frame: .zero)
        locationLabel.font = UIFont.ralewayExtraLightFontWithSize(24)
        locationLabel.textAlignment = .center
        locationLabel.text = "Ridgewood, Queens"
        locationLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(locationLabel)
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).inset(32)
        }
        
        ovm.delta.asObservable().subscribe(onNext: { deltaModel in
            
            guard let model = deltaModel else { return }
            locationLabel.text = "\(model.location.cityName), \(model.location.stateName)"
            let deltaInt = Int(model.todayTemp.tempF - model.yesterdayTemp.tempF)
            deltaLabel.text = "\(deltaInt)°"
            yesterdayTempLabel.text = "\(Int(model.yesterdayTemp.tempF))°"
            todayTempLabel.text = "\(Int(model.todayTemp.tempF))°"
            deltaLabel.textColor = WeatherDeltaColorViewModel.colorForDelta(deltaInt)
            locationLabel.textColor = deltaLabel.textColor
            yesterdayTempLabel.textColor = deltaLabel.textColor
            todayTempLabel.textColor = deltaLabel.textColor
        }).addDisposableTo(disposeBag)
    }
}

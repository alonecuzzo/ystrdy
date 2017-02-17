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
        
        let nycCoordinates = LocationCoordinate(latitude: 40.712784, longitude: -74.005941)
        
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
        
        let inset = 48
        
        let yesterdayTempLabel = UILabel(frame: .zero)
        yesterdayTempLabel.font = UIFont.ralewayExtraLightFontWithSize(48)
        yesterdayTempLabel.textAlignment = .center
        yesterdayTempLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(yesterdayTempLabel)
        yesterdayTempLabel.snp.makeConstraints { make in
            make.left.equalTo(inset)
            make.top.equalTo(250)
        }
        
        let yesterdayLabel = UILabel(frame: .zero)
        yesterdayLabel.font = UIFont.ralewayExtraLightFontWithSize(24)
        yesterdayLabel.textAlignment = .center
        yesterdayLabel.text = "yesterday"
        yesterdayLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(yesterdayLabel)
        yesterdayLabel.snp.makeConstraints { make in
            make.centerX.equalTo(yesterdayTempLabel)
            make.top.equalTo(yesterdayTempLabel.snp.bottom).offset(10)
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
        
        let todayLabel = UILabel(frame: .zero)
        todayLabel.font = UIFont.ralewayExtraLightFontWithSize(24)
        todayLabel.textAlignment = .center
        todayLabel.text = "today"
        todayLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(todayLabel)
        todayLabel.snp.makeConstraints { make in
            make.centerX.equalTo(todayTempLabel)
            make.top.equalTo(todayTempLabel.snp.bottom).offset(10)
        }
        
        let locationLabel = UILabel(frame: .zero)
        locationLabel.font = UIFont.ralewayExtraLightFontWithSize(24)
        locationLabel.textAlignment = .center
        locationLabel.text = "Ridgewood, Queens"
        locationLabel.numberOfLines = 0
        locationLabel.lineBreakMode = .byWordWrapping
        locationLabel.textColor = UIColor.ystrdyWarm()
        view.addSubview(locationLabel)
        
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).inset(32)
            make.left.right.equalTo(view).inset(32)
        }
        
        ovm.delta.asObservable().subscribe(onNext: { deltaModel in
            
            guard let model = deltaModel else { return }
            
            switch model.location.locationType {
            case .national:
                locationLabel.text = "\(model.location.cityName), \(model.location.stateName)"
            case .international, .none:
                locationLabel.text = "\(model.location.cityName), \(model.location.countryName)"
            }
            
            let deltaInt = Int(model.todayTemp.tempF - model.yesterdayTemp.tempF)
            deltaLabel.text = "\(deltaInt)°"
            yesterdayTempLabel.text = "\(Int(model.yesterdayTemp.tempF))°"
            todayTempLabel.text = "\(Int(model.todayTemp.tempF))°"
            deltaLabel.textColor = WeatherDeltaColorViewModel.colorForDelta(deltaInt)
            locationLabel.textColor = deltaLabel.textColor
            yesterdayTempLabel.textColor = deltaLabel.textColor
            todayTempLabel.textColor = deltaLabel.textColor
            yesterdayLabel.textColor = deltaLabel.textColor
            todayLabel.textColor = deltaLabel.textColor
        }).addDisposableTo(disposeBag)
    }
}

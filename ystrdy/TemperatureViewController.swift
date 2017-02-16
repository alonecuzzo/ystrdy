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
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.ralewayExtraLightFontWithSize(100)
        label.textAlignment = .center
        label.text = "loading"
        label.textColor = UIColor.ystrdyWarm()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
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
            label.text = "\(deltaInt)°"
            label.textColor = WeatherDeltaColorViewModel.colorForDelta(deltaInt)
            locationLabel.textColor = label.textColor
        }).addDisposableTo(disposeBag)
    }
}

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


class ViewController: UIViewController {
    
    //MARK: Property
    private let disposeBag = DisposeBag()
    

    //MARK: Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.ystrdyDarkPurple()
        
        let nycCoordinates = CGPoint(x: 40.712784, y: -74.005941)
        let vm = WeatherDifferenceViewModel()
        vm.updateWeatherDifferenceForLocation(nycCoordinates)
        
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        label.textColor = UIColor.ystrdyWarm()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        vm.weatherDelta.asObservable().filter{ $0.characters.count > 0 }.subscribe(onNext: { delta in
            label.text = delta
        }).addDisposableTo(disposeBag)
    }
}

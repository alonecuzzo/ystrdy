//
//  ViewController.swift
//  ystrdy
//
//  Created by Jabari on 8/30/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //MARK: variables
    
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    let viewModel: WeatherViewModel
    private var bindingHelper: TableViewBindingHelper!
    
    let coreLocationManager :CLLocationManager = CLLocationManager()
    
    //MARK: init stuff
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "WeatherViewController", bundle: nil)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // we want a font and background color struct
        edgesForExtendedLayout = .None
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        coreLocationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreLocationManager.delegate = self
        coreLocationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        searchButton.rac_command = viewModel.executeSearch
        
        searchButton.rac_command.executionSignals.subscribeNext {
            (s: AnyObject!) -> Void in
            let signal: RACSignal? = s as? RACSignal
            if let signal = signal {
                signal.subscribeCompleted({
                    () -> Void in
                    self.refreshViewWithWeatherDifference(self.viewModel.tempDifference)
                })
            }
        }
    }
    
    func refreshViewWithWeatherDifference(difference: Double) {
        let difference = self.viewModel.tempDifference
        let roundedDifference = Int(difference)
        var backgroundColor :UIColor
        
        //have no idea how to put bools in a switch statement.... wth
        if roundedDifference > 0 {
            backgroundColor = UIColor.ystrdyWarm()
        } else if roundedDifference < 0 {
            backgroundColor = UIColor.ystrdyCool()
        } else {
            backgroundColor = UIColor.ystrdyIdentical()
        }
        
        dispatch_async(dispatch_get_main_queue(), {
            self.refreshWithBackgroundColor(backgroundColor, temp: "\(abs(roundedDifference))")
        })
    }
    
    func refreshWithBackgroundColor(backgroundColor: UIColor, temp: String) {
        self.view.backgroundColor = backgroundColor;
        self.temperatureLabel.text = temp
        self.cityLabel.text = viewModel.cityName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    //MARK: core location
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        coreLocationManager.stopUpdatingLocation()
        //we'll probably use this at a later time
        viewModel.location = newLocation
        getPlacemarkFromLocation(newLocation)
        println(newLocation.coordinate.latitude)
        println(newLocation.coordinate.longitude)
    }
    
    func getPlacemarkFromLocation(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            { (placemarks, error) in
                if (error != nil) {println("reverse geodcode fail: \(error.localizedDescription)")}
                let pm = placemarks as [CLPlacemark]
                if pm.count > 0 {
                    let pm: AnyObject = placemarks[0]
                    let city = pm.locality
                    self.viewModel.cityName = city
                    self.viewModel.searchSignal().subscribeCompleted {
                        () -> Void in
                        self.refreshViewWithWeatherDifference(self.viewModel.tempDifference)
                    }
                }
        })
    }
}


//
//  ViewController.swift
//  ystrdy
//
//  Created by Jabari on 8/30/14.
//  Copyright (c) 2014 twenty.three.bit. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: variables
    
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    let viewModel: WeatherViewModel
    private var bindingHelper: TableViewBindingHelper!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.cityName = "Tokyo"
        searchButton.rac_command = viewModel.executeSearch
        
        cityLabel.text = viewModel.cityName
        
        searchButton.rac_command.executionSignals.subscribeNext {
            (s: AnyObject!) -> Void in
            let signal: RACSignal? = s as? RACSignal
            if let signal = signal {
                signal.subscribeCompleted({
                    () -> Void in
                    //we can get the difference!
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
                })
            }
        }
    }
    
    func refreshWithBackgroundColor(backgroundColor: UIColor, temp: String) -> Void {
        self.view.backgroundColor = backgroundColor;
        self.temperatureLabel.text = temp
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
}


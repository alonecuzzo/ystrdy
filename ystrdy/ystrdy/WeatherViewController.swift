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
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel: WeatherViewModel
    
    private var bindingHelper: TableViewBindingHelper!
    
    //MARK: init stuff
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: "WeatherViewController", bundle: nil)
        
        self.view.backgroundColor = UIColor.ystrdyWarm()
        
        // we want a font and background color struct
        edgesForExtendedLayout = .None
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bindingHelper = TableViewBindingHelper(tableView: tableView, sourceSignal: RACObserve(viewModel, "items"), nibName: "", selectionCommand: nil)
        
        let wsi = WeatherSearchImp()
        wsi.getWeatherData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
}


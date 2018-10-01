//
//  ViewController.swift
//  Open Weather
//
//  Created by Jessica Hollander on 27/09/18.
//  Copyright © 2018 jess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var presenter: Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter()
        presenter.setUpView(vc: self)
        WeatherClient.getCurrentWeather(cityId: 3451190, unit: "metric"){ results, error in
            if results != nil{
                self.presenter.cityLabel.text = "\(results!.name)"
                self.presenter.weatherLabel.text = "\(results!.main.temp)" + "°C"
                
            } else{
            print("no results")
            }
        }
    }
}


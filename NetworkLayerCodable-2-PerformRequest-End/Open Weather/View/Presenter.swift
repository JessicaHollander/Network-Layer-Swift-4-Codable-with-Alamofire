//
//  Presenter.swift
//  Open Weather
//
//  Created by Jessica Hollander on 27/09/18.
//  Copyright © 2018 jess. All rights reserved.
//

import UIKit

class Presenter{
    //create view elements
    var weatherLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        label.text = "29°C"
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cityLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Rio de Janeiro"
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setUpView(vc: ViewController){
        //configure view
        vc.view.backgroundColor = UIColor.purple
        
        //add elements to view
        vc.view.addSubview(weatherLabel)
        vc.view.addSubview(cityLabel)
        
        
        //set constraints
        var safeTopAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return vc.view.safeAreaLayoutGuide.topAnchor
            } else {
                return vc.view.topAnchor
            }
        }
        
        weatherLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        weatherLabel.topAnchor.constraint(equalTo: safeTopAnchor, constant: 80).isActive = true
        
        cityLabel.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 10).isActive = true
    }
}

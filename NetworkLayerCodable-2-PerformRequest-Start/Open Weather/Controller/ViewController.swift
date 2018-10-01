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
    }
}


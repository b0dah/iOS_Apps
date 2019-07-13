//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Иван Романов on 13/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true


    @IBAction func lightButtonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }

}


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

    @IBOutlet weak var firstButton: UIButton!
    
    @IBAction func firstButtonPressed(_ sender: UIButton) {
        firstButton.backgroundColor = UIColor.cyan
        
        lightOn = !lightOn
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            firstButton.setTitle("Off", for: .normal)
        }
        else {
            view.backgroundColor = .black
            firstButton.setTitle("On", for: .normal)
        }
    }

}


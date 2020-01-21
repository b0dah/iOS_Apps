//
//  ViewController.swift
//  GarbageCollector
//
//  Created by Иван Романов on 16.12.2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var segueSwitch: UISwitch!
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        guard (segueSwitch.isOn) else {
            return
        }
        performSegue(withIdentifier: "Yellow", sender: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        guard (segueSwitch.isOn) else {
            return
        }
        performSegue(withIdentifier: "Green", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


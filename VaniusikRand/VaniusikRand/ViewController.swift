//
//  ViewController.swift
//  VaniusikRand
//
//  Created by Иван on 08/11/2018.
//  Copyright © 2018 Иван. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func letsgo(_ sender: UIButton) {
        //result.text = result.text! + String(sender.tag)
        result.text = String(55)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


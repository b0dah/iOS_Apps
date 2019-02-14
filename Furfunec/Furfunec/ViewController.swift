//
//  ViewController.swift
//  Furfunec
//
//  Created by Иван Романов on 01/01/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var states : [String] = ["парасик", "пурсуйчик", "фурфунец", "парасишка", "фурфунишка", "парасюк", "драбленочкалюб", "похрюнишка", "похрюнец", "свинтус"]
    
    @IBOutlet weak var StateTextLabel: UILabel!
    
    @IBAction func button(_ sender: Any) {
        StateTextLabel.text = states[Int.random(in: 0...9)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        StateTextLabel.text = "?"
    }


}


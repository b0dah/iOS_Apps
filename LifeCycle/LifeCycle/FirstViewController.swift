//
//  ViewController.swift
//  LifeCycle
//
//  Created by Иван Романов on 21.01.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("F: View Did Load")
    }
    
    // Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("F: View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("F: View Did Appear")
    }
    
    // Dis
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("F: View Will Disppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("F: View Did Disappear")
    }


}


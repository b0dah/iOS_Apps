//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by Иван Романов on 21.01.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        print("S: View Did Load")
    }
    
    // Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("S: View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("S: View Did Appear")
    }
    
    // Dis
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("S: View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("S: View Did Disppear")
    }

}

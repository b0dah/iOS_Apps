//
//  DataPresentingViewController.swift
//  TableViewExample
//
//  Created by Иван Романов on 20.04.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class DataPresentingViewController: UIViewController {

    var museum: Museum?
    
    @IBOutlet weak var museumNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let museum = museum {
            museumNameLabel.text = museum.name
        } else {
            print("!!!!!!!!!!!! No value passed!")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

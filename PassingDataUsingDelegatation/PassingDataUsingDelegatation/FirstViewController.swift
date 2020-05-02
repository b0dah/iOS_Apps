//
//  FirstViewController.swift
//  PassingDataUsingDelegatation
//
//  Created by Иван Романов on 02.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, DataSendingDelegateProtocol {
    @IBOutlet weak var receivedDataLabel: UILabel!
    @IBAction func getDataButtonClicked(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func sendData(data: String) {
        receivedDataLabel.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "GetDataSegue" else {
            return
        }
        
        if let secondViewController = segue.destination as? SecondViewController {
            secondViewController.delegate = self
        }
    }
    
}

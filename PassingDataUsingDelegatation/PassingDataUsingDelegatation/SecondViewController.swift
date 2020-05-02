//
//  FirstViewController.swift
//  PassingDataUsingDelegatation
//
//  Created by Иван Романов on 02.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataToSendTextField: UITextField!
    
    
    var delegate: DataSendingDelegateProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataButtonClicked(_ sender: UIButton) {
        
        guard delegate != nil else {
            return
        }
        
        if let dataToBeSent = dataToSendTextField.text {
            self.delegate?.sendData(data: dataToBeSent)
            dismiss(animated: true, completion: nil)
        }
    }
    
}

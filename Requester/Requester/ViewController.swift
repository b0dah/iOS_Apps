//
//  ViewController.swift
//  Requester
//
//  Created by Иван Романов on 11.10.2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var requestParameterField: UITextField!
    @IBOutlet var responseLabel: UILabel!
    
    @IBAction func didSendButtonClick(_ sender: UIButton) {
        
        let initialUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
        
        let parameters: [String : String] = [ "api_key" : "DEMO_KEY",
                                              "date" : "2011-07-13"]
        
        let url = initialUrl.withQueries(parameters)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data{
                let stringData = String(data: data, encoding: .utf8)
                print(stringData)
            }
        }
        
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


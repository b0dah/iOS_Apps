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
        
        guard let initialUrl = URL(string: "https://api.nasa.gov/planetary/apod") else {
            print("wrong url")
            return
        }
        
        let parameters: [String : String] = [ "api_key" : "DEMO_KEY",
                                              "date" : "2011-07-13"]
        
        var request = URLRequest(url: initialUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("wrong parameters")
            return
        }
        request.httpBody = httpBody
       
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data{
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                        let name = json["Name"] as? String {
                            print(json)
                            DispatchQueue.main.async {
                                self.responseLabel.text = name
                        }
                    }
                } catch {
                    print("*** that's error", error)
                }
            }
        }
        
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


//
//  ViewController.swift
//  LoginRequest
//
//  Created by Иван Романов on 24.10.2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    let url = URL(string: "http://IvansMacBookPro.local:8000/api/museums")!
    var jsonString: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.responseLabel.text = self.jsonString
            }
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    self.jsonString = String(data: data, encoding: .utf8)!
                    print(json)
                } catch {
                    print(error)
//                    self.responseLabel.text = "error"
                }
            }
            else {
                print("не дата")
            }
        }
        task.resume()
        
        
        

    }


}


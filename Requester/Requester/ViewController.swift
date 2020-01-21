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
    
    @IBOutlet var orangeView: UIView!
    @IBAction func didSendButtonClick(_ sender: UIButton) {
        
        guard let initialUrl = URL(string: "http://localhost:8080/warning_vhodit_krisa") else {
            print("wrong url")
            return
        }
        
        let parameters: [String : String] = [ "login" : "DEMO_KEY",
                                              "password" : "DEMO_KEY"]
        let urlWithParameters = initialUrl.withQueries(parameters)!
                                            
        var request = URLRequest(url: urlWithParameters)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
//            print("wrong parameters")
//            return
//        }
//        request.httpBody = httpBody
       
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data{
                
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
//                        let name = json["Name"] as? String {
//                            print(json)
////                            DispatchQueue.main.async {
////                                self.responseLabel.text = name
////                        }
//                    }
//                } catch {
//                    print("*** that's error", error)
//                }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    //let result = try! JSONDecoder().decode(UserModel.self, from json)
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = 2
        self.responseLabel.text = a
        
        let width: CGFloat = self.orangeView.bounds.width
        print("width = ", width)
        
        let borderWidth: Double = 2.0
        
        //var x: CGFloat
        for curX in stride(from: 0.0, to: 350.0*2, by: 50.0) {
            let borderView: UIView = UIView(frame: CGRect.init(x: curX, y: 0.0, width: borderWidth, height: 200.0))
            borderView.backgroundColor = .gray
            self.orangeView.addSubview(borderView)
        }
        
        
    }

}


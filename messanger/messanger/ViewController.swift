//
//  ViewController.swift
//  messanger
//
//  Created by Иван on 04/12/2018.
//  Copyright © 2018 Иван. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let AccessToken = "eaab198bb6705808f525ad2a81b0300228778ed6488e60888cd9a55957b3ab31c702394787510f5ad3c34"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //------------------
        //let url: String = "https://httpbin.org/get"
        var url: String = "https://api.vk.com/method/users.get?user_id=210700286&v=5.52"
        url += "&access_token=\(AccessToken)"
        
        AF.request(url, method: .get).validate().responseJSON {
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}


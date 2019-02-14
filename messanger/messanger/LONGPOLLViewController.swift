//
//  LONGPOLLViewController.swift
//  messanger
//
//  Created by Иван Романов on 02/01/2019.
//  Copyright © 2019 Иван. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LONGPOLLViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://\(server)?act=a_check&key=\(key)&ts=\(ts)&wait=25&mode=2&version=2&access_token=\(AccessToken)"
        
        AF.request(url, method: .get).validate().responseJSON { 
            response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("     j s o n : ")
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    

    
}

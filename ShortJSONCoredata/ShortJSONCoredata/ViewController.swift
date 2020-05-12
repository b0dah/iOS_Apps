//
//  ViewController.swift
//  ShortJSONCoredata
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func savePaintings(json: Data) {
      
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let decoder = JSONDecoder()
        
        decoder.userInfo[CodingUserInfoKey.context!] = appDelegate.persistentContainer.viewContext
        
        do {
            let fetchedObject = try decoder.decode(PaintingsWrapper.self, from: json)
            let paintings = fetchedObject.paintings
            
            
        } catch {
            
        }
    }

}


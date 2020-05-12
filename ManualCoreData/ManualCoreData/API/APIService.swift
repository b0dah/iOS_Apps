//
//  APIService.swift
//  ManualCoreData
//
//  Created by Иван Романов on 11.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import Foundation
import UIKit

enum Result <T> {
    case success(T)
    case error(String)
}

public class APIService {
    let endPoint = "http://ivansmacbookpro.local:8000/api/paintings?museum_id=1"
    
    func retrieveDataWith(completion: @escaping (Result < [[String: AnyObject]]>)->Void) {
        
        guard let url = URL(string: endPoint) else {
            completion(.error("wrong url"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.error("Error occured while requesting remote data \(error?.localizedDescription)"))
                return
            }
        
            guard let data = data else {
                completion(.error("0 data retrieved"))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let paintingsJSONArray = json["paintings"] as? [[String: AnyObject]] else {
                        completion(.error(error?.localizedDescription ?? "There are no new Items to show"))
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(paintingsJSONArray))
                    }
                }
                else {
                    print("cant create json object")
                }
                
            } catch let error as NSError {
                print(error.userInfo)
            }
            
        
        }.resume()
    }
}

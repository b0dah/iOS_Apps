//
//  ViewController.swift
//  CoreDataJSONManualParsingModel
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        retrieveDataFromAPI { (data) in
//            if let data = data {
//                self.savePaintings(json: data)
//              
//            } else {
//                print("nil data came")
//            }
//        }
        
          self.fetchPaintings()
    }

    func retrieveDataFromAPI(completion: @escaping (Data?)->Void) {
        
        guard let url = URL(string: "http://127.0.0.1:8000/api/paintings?museum_id=1") else {
            return
            print("wrong url")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("No data retrived")
                completion(nil)
                return
            }
            
            print(data)
            DispatchQueue.main.async {
                completion(data)

            }
        }.resume()
        
    }
    
    func savePaintings(json: Data) {
        
//        guard let pathToFile = Bundle.main.path(forResource: "paintings", ofType: "json") else {
//            fatalError("file not found")
//        }
//
//        guard let urlToFile = URL(string: pathToFile) else {
//            fatalError("couldnt retrieve json data")
//        }
        
//        guard let json = try? Data(contentsOf: urlToFile) else {
//            print("couldmt load data from file")
//            return
//        }
        ////////////
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("No app delegate")
            return
        }

        let decoder = JSONDecoder()

        decoder.userInfo[CodingUserInfoKey.context!] = appDelegate.persistentContainer.viewContext

        do {
            let fetchedObject = try decoder.decode(PaintingWrapper.self, from: json)
            let paintings = fetchedObject.paintings


        } catch {
            print("Error fetching")
        }
    }
    
    func fetchPaintings() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PaintingWrapper")
        
        do {
            let paintingWrappers = try managedContext.fetch(fetchRequest)
            print(paintingWrappers.count)

        } catch let error as NSError {
            print("Couldn't fetch \(error) \(error.userInfo)")
        }
    }

}


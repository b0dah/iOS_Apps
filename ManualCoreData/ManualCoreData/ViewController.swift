//
//  ViewController.swift
//  ManualCoreData
//
//  Created by Иван Романов on 11.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var paintings: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = APIService()
        service.retrieveDataWith {
            (result) in
            switch (result) {
                case .success(let data):
                    self.saveInCoreData(array: data)
                    print(data)
                    self.fetchFromCoreData()
                case .error(let message):
                    print(message)
            }
        }
//        fetchFromCoreData()
//        print(paintings.count)
        
        if let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {
                print(url.absoluteString)
            }
        
    }

    
    private func saveInCoreData(array: [[String: AnyObject]]) {
        array.map { self.createPaintingEntity(dictionary: $0) }
        
        do {
            try CoreDataManager.sharedInstance.persistentContainer.viewContext.save()
            print("Saved!")
        } catch let error {
            print(error)
        }
    }
    
    private func createPaintingEntity(dictionary: [String: AnyObject]) -> NSManagedObject? {
        let context = CoreDataManager.sharedInstance.persistentContainer.viewContext
        
        if let paintingEntity = NSEntityDescription.entity(forEntityName: "Painting", in: context) as? Painting {
            /*!*/paintingEntity.id = (dictionary["id"] as? Int32)!
            paintingEntity.title = dictionary["title"] as? String
            
            return paintingEntity
        }
        
        print("no entity")
        return nil
    }
    
    
    func fetchFromCoreData() {
        let context = CoreDataManager.sharedInstance.persistentContainer.viewContext

        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Painting.self))
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Painting")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do {
            try paintings = context.fetch(fetchRequest)
            print("fetched \(paintings.count)")
        } catch let error as NSError {
            print("Couldn't fetch \(error) \(error.userInfo)")
        }
    }

}


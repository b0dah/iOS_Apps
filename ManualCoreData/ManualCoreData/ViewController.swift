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
    @IBOutlet weak var imageView: UIImageView!
    
    var paintings: [Painting] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = APIService()
        service.retrieveDataWith {
            (result) in
            switch (result) {
                case .success(let data):
                    self.saveInCoreData(array: data)
                    self.fetchFromCoreData()
                case .error(let message):
                    print(message)
            }
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
        
//        if let paintingEntity = NSEntityDescription.entity(forEntityName: "Painting", in: context) {
//            as? Painting {
//            /*!*/paintingEntity.id = (dictionary["id"] as? Int32)!
//            paintingEntity.title = dictionary["title"] as? String
            
            //1
//            let painting = NSManagedObject(entity: paintingEntity, insertInto: context)
//            painting.setValue(dictionary["id"], forKey: "id")
//            painting.setValue(dictionary["title"], forKey: "title")
            
            //2
            let painting = Painting(context: context)
            painting.id = 100
            painting.title = "100"
            
        if let imageData = UIImage(named: "image")?.jpegData(compressionQuality: 1.0) {
            print("image's here")
            painting.image = imageData
        } else {
            print("no such image in bundle")
        }
            
        return painting
        
//        print("no entity")
//        return nil
    }
    
    
    func fetchFromCoreData() {
        let context = CoreDataManager.sharedInstance.persistentContainer.viewContext

        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Painting.self))
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Painting")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        
        do {
            try paintings = context.fetch(fetchRequest) as? [Painting] ?? []
            print("fetched \(paintings.count)")
        } catch let error as NSError {
            print("Couldn't fetch \(error) \(error.userInfo)")
        }
        
//        DispatchQueue.main.async {
            guard let imageField = self.paintings[0].image else {
                print("Field is null")
                print(paintings.count)
                return
            }
            
            guard let imageData = self.paintings[0].image else {
                print("no imagedata")
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                print("nah image")
                return
            }
                
            self.imageView.image = image
            
//        }
    }

}


//
//  CoreDataHelper.swift
//  NewsApp
//
//  Created by Иван Романов on 29/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MainViewController {
    
    func saveDataToDataBase() {
        
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        
        let context = delegate?.persistentContainer.viewContext as! NSManagedObjectContext
        
        
        
        let firstOne = NSEntityDescription.insertNewObject(forEntityName: "ArticleEntity", into: context) as! ArticleEntity
        
        firstOne.headline = "HEADLINE"
        firstOne.body = "jopr"
        firstOne.date = "378"
        firstOne.imageUrl = "sdds"
        
        do {
            try context.save()
            print("saved to CoreData")
        } catch let error {
            print(error)
        }

    }
}

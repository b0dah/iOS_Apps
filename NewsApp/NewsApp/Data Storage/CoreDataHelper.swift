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
    
    
    func clearDataBaseData() {
        
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        
        if let context = delegate?.persistentContainer.viewContext {
        
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")
                 fetchRequest.returnsObjectsAsFaults = false
                
                let articles = try(context.fetch(fetchRequest) as? [NSManagedObject])

                for article in articles! {
                    context.delete(article)
                }
                
                try(context.save())
               
            } catch let error {
                print(error)
            }
        }
    }
    
    func saveDataToDataBase() {
        
        clearDataBaseData()
        
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        
        if let context = delegate?.persistentContainer.viewContext {
        
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
            
            FetchDataFromDataBase()
        }
    }
    
    
    func FetchDataFromDataBase()  {

       let delegate = (UIApplication.shared.delegate as? AppDelegate)
        
       if let context = delegate?.persistentContainer.viewContext {
        
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")
            fetchRequest.returnsObjectsAsFaults = false
        
            do {
                let articaaal = try context.fetch(fetchRequest) as? [ArticleEntity] //!!! let articaaal = try (context.execute(fetchRequest) as? [ArticleEntity])
                print("fetched from the DB")
                print(" -> ", articaaal?.last?.headline)
            } catch let error {
                print(error)
            }
        }
        
    }
}

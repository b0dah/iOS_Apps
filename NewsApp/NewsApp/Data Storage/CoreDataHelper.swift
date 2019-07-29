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
        
            for eachArticle in self.articles {
                
                let currentObject = NSEntityDescription.insertNewObject(forEntityName: "ArticleEntity", into: context) as! ArticleEntity

                currentObject.headline = eachArticle.headline
                currentObject.body = eachArticle.body
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                guard let date = dateFormatter.date(from: eachArticle.date ) else {
                    fatalError("ERROR: Date conversion failed due to mismatched format.")
                }
                currentObject.date = date as NSDate
                currentObject.imageUrl = eachArticle.imageUrl
            }
            
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
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
            do {
                let object = try context.fetch(fetchRequest) as? [ArticleEntity]
                self.articleEntities = object!
                
                DispatchQueue.main.async {
                    if !self.tabbleViewDidUpdated {
                        self.fetchArticles()
                    }
                    self.tableView.reloadData()
                }
                
                
                //print("fetched from the DB \(object?.count) items")
                //print("urlToImage is ... ", object?[0].imageUrl)
            
            } catch let error {
                print(error)
            }
        }
        
    }
}

//
//  SearchBarImplementation.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension MainViewController: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = true
    }
    
    // MARK: - Search functionality logic
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            var predicate = NSPredicate()
            predicate = NSPredicate(format: "headline contains[c] '\(searchText)'")
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")
            fetchRequest.predicate = predicate
            
            do {
                
                self.articleEntities = try context.fetch(fetchRequest) as! [ArticleEntity]
                
            }
            catch {
                print("Coudnt get search data")
            }
        }
        else {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let context = delegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")
            
            do {
                self.articleEntities = try context.fetch(fetchRequest) as! [ArticleEntity]
            } catch {
                print("Coudnt get search data")
            }
            
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Searching Did Stop
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Stop doing the search stuff
        searchBar.text = ""
        // Hide the cancel button
        searchBar.showsCancelButton = false
        // Remove focus from the search bar.
        searchBar.endEditing(true)
        // and eventually reload the Table View
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleEntity")

        do {
            self.articleEntities = try context.fetch(fetchRequest) as! [ArticleEntity]
        } catch {
            print("Coudnt get search data")
        }
        self.tableView.reloadData()
    }
    

    
}

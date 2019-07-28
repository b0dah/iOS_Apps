//
//  SearchBarUI.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func setNavigationBar() {
        navigationItem.title = "News Feed"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.searchController = searchController
        navigationController?.navigationBar.backgroundColor = .green
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 34)!
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = attrs
    
        // MARK: - Search Bar Appearence
        searchController.searchBar.tintColor = .orange
        searchController.searchBar.placeholder = "Start typing"
        
        //text color
         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
    
    
}

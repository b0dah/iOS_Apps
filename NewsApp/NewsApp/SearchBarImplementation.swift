//
//  SearchBarImplementation.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController: UISearchBarDelegate {
    
    func setUpSearchBar(){
        searchController.searchBar.delegate = self
    }
    
}

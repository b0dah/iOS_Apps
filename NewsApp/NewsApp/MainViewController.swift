//
//  MainViewController.swift
//  NewsApp
//
//  Created by Иван Романов on 24/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Live Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //fetchArticles()
        setNavigationBar()
        setUpSearchBar()
        createTableViewUI()
    }
    


}

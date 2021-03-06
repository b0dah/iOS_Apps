//
//  MainViewController.swift
//  NewsApp
//
//  Created by Иван Романов on 24/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tabbleViewDidUpdated = false
    
    var articles = [Article]()
    var articleEntities = [ArticleEntity]()
    

    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Live Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FetchDataFromDataBase()
        
        setNavigationBar()
        setUpSearchBar()
        createTableViewUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "Back.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        self.tableView.backgroundColor = UIColor.clear
    }

}

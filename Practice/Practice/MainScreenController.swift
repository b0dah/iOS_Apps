//
//  MainScreen.swift
//  PracticeDraft
//
//  Created by Иван Романов on 15/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {
    
    var items = [Item]()
    var searchedItems = [Item]()
    
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromJSON()
        setUpSearchBar()
        
        setupNavigationBar()
    }
    
    // MARK: - Main screen appearence
    
    override func viewWillAppear(_ animated: Bool) {
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "Back.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        self.tableView.backgroundColor = UIColor.clear
        
        
        // no lines where there aren't cells
        tableView.tableFooterView = UIView()
        
        // no separators betw cells
        tableView.separatorColor = UIColor.clear
    }
    
    // MARK: - setting up the Navigation Bar
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }

}



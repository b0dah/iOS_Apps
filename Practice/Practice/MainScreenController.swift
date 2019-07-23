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
        
        searchController.searchBar.placeholder = "Поиск"
        
        var textFieldInsideSearchBar = searchController.searchBar.value(forKey: "_searchField") as? UITextField
        //textFieldInsideSearchBar?.textColor =
        textFieldInsideSearchBar?.backgroundColor = UIColor(red: 133/255, green: 33/255, blue: 33/255, alpha: 0.72)
        
        // no lines where there aren't cells
        tableView.tableFooterView = UIView()
        
        // table view's appearence
        tableView.separatorColor = UIColor.clear /**/
        
        //height
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 170.0
    }
    
    // MARK: - setting up the Navigation Bar
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }

}



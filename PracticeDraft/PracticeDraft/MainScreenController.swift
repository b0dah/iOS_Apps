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

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromJSON()
        setUpSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "Back.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        self.tableView.backgroundColor = UIColor.clear
        
        //BAck for top view
        //topView.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.72)
        //searchBar.barTintColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.72)
        //self.navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 149/255, blue: 0, alpha: 1)
        searchBar.placeholder = "Поиск"
        
        // no lines where there aren't cells
        tableView.tableFooterView = UIView()
        
        // table view's appearence
        tableView.separatorColor = UIColor.clear /**/
        //height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 170.0
        
    }

}



//
//  TableViewUI.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func createTableViewUI() {
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "ArticleCell")
    }
}

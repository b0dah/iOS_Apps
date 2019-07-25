//
//  TableViewImplementation.swift
//  NewsApp
//
//  Created by Иван Романов on 25/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell
            else {
                return UITableViewCell()
        }

        
        cell.pictureView.image = UIImage(named: "imageName")
        cell.headlineLabel.text = "headlineLabel     headlineLabel"
        cell.descriptionLabel.text = "descriptionLabel    descriptionLabel"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}


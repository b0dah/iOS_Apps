//
//  ViewController.swift
//  AutoLayoutTableView
//
//  Created by Иван Романов on 21/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let array = ["Lucie", "Max", "Jessica ipad pro is an amazing table that works really well with the apple pencil that you can draw some really cool on ||||| \n Jessica ipad pro is an amazing table that works really well with the apple pencil that you can draw some really cool on", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // no lines where there aren't cells
        tableView.tableFooterView = UIView()
       
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "cell") as! CustomTableViewCell
        
        
        if array[indexPath.row] == "" {
            cell.mainStackView.arrangedSubviews.last?.isHidden = true
            cell.mainStackView.arrangedSubviews[1].isHidden = true
            
            cell.topStackView.arrangedSubviews.first?.isHidden = true
        }
        else {
            cell.mainStackView.arrangedSubviews.last?.isHidden = false
            cell.mainStackView.arrangedSubviews[1].isHidden = false
            cell.topStackView.arrangedSubviews.first?.isHidden = false
            cell.descriptionLabel.text = array[indexPath.row]
            }
            cell.titleLabel.text = "name"
        
        return cell
    }
    
}


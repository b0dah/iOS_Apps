//
//  MainScreen.swift
//  PracticeDraft
//
//  Created by Иван Романов on 15/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let contentList = [ "I", "need", "to", "populate", "the", "tableView", "with", "the","json","data", "yep" ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = contentList[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   

}

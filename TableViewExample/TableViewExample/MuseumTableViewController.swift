//
//  EmojiTableViewController.swift
//  TableViewExample
//
//  Created by Иван Романов on 19.04.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var museums = [
        Museum(name: "Museum of Contemporary Art Tokyo", city: <#T##String#>)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // setting table view controller
    // MARK: Table View Datasource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        }
        else { // not necess, but it's a template
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath)
        let emoji = emojis[indexPath.row]
        
        cell.textLabel?.text = emoji.symbol + " - " + emoji.name
        cell.detailTextLabel?.text = emoji.name
        cell.showsReorderControl = true // REORDERING
        
        return cell
    }
    
    // MARK: Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emojiTapped = emojis[indexPath.row]
        print(String(indexPath.row) + " - " + emojiTapped.symbol)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) { // REORDERING
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    
    
}

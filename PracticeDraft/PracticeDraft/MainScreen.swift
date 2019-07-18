//
//  MainScreen.swift
//  PracticeDraft
//
//  Created by Иван Романов on 15/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var items = [Item]()
    private var searchedItems = [Item]()

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSON()
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
        tableView.estimatedRowHeight = 110.0
    }

///////////////////////////////////////////////////////////////
    func getJSON() {
        guard let path = Bundle.main.path(forResource: "items", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            guard let data = data, error == nil, urlResponse != nil else {
                print("error while getting")
                return
            }
            
            print("downloaded")
            
            do {
                let decoder = JSONDecoder()
                let donloadedItems = try decoder.decode([Item].self, from: data)
                
                self.items = donloadedItems
                self.searchedItems = donloadedItems /* for searching */
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
            }
            catch {
                print("smt wrong after getting")
            }
            
        }.resume()
    }
    
    //SEARCH
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        return searchedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell
        else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = searchedItems[indexPath.row].name
        cell.descriprionLabel.text = searchedItems[indexPath.row].description
        
        
        if let imageId = items[indexPath.row].imageId {
            cell.iconView.image = UIImage(named: String(imageId) )
        }
        else {
            cell.iconView.isHidden = true
        }
        
        if items[indexPath.row].participant[0].name == nil {  // if no participant
            cell.participantStackView.isHidden = true
        }
        else {
            if let imageId = items[indexPath.row].participant[0].imageId { // avatar
                cell.avatarView.image = UIImage(named: String(imageId) )
            }
            else {
                cell.avatarView.isHidden = true
            }
        }
        
        return cell
    }
    
    //APPEARENCE
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.row].participant[0].name == nil {
            return 68
        }
        else {
            return 220
        }
    }
    
    // SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty  else {
            searchedItems = items
            tableView.reloadData()
            return
        }
        searchedItems = items.filter({item -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
   
    
    
    

}



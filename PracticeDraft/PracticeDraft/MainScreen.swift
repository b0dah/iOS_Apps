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

    @IBOutlet var topView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSON()
        
        UISearchBar()
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
        tableView.estimatedRowHeight = 70.0
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
                
                DispatchQueue.main.async {
                     self.tableView.reloadData()
                }
            }
            catch {
                print("smt wrong after getting")
            }
            
        }.resume()
        
        searchedItems = items /* for searching */
    }
    
    //SEARCH
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell
        else {
            return UITableViewCell()
        }
        
        //cell.nameLabel.text = items[indexPath.row].name
        //cell.descriprionLabel.text = items[indexPath.row].description
        
        if indexPath.row == 1 {
            cell.descriprionLabel.isHidden = true
        }
        
        /*if let imageId = items[indexPath.row].imageId {
            cell.avatarView.image = UIImage(named: String(imageId) )
        }
        else {
            cell.avatarView.isHidden = true
        }*/
        
        return cell
    }
    
    //APPEARENCE
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.row].participant[0].name == nil {
            return 70
        }
        else {
            return 150
        }
    }*/
    
    // SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        <#code#>
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        <#code#>
    }
    
    

}



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
    var items = [Item]()
    
    
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
        
        getJSON()
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
                //print(donloadedItems[0].venue)
                
                self.items = donloadedItems
                print(self.items[0].participant[0].company)
            }
            catch {
                print("smt wrong after getting")
            }
            
        }.resume()
    }
   

}

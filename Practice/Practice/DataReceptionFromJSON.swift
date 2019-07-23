//
//  DataReceptionFromJSON.swift
//  PracticeDraft
//
//  Created by Иван Романов on 21/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

extension MainScreenController {

    func getDataFromJSON() {
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
}
 

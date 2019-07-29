//
//  FetchingArticles.swift
//  NewsApp
//
//  Created by Иван Романов on 24/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

extension MainViewController {

    func fetchArticles() {

        let baseUrl = URL(string: "https://newsapi.org/v1/articles")!

        let query : [String: String] = [
            "source": "techcrunch",
            "apiKey": "cd86ecda9cbf4320adf5c0372a0a4c4c" //"d8b23d8849114ea387fa690586fb7a57"
        ]

        let url = baseUrl.withQueries(query)!

        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("error while fetching")
                return
            }
            print("Data downloaded")

            do {
                let jsonDecoder = JSONDecoder()
                let fetchedObject = try jsonDecoder.decode(FetchedObject.self, from: data)
                
                self.articles = fetchedObject.articles
                
                guard !self.tabbleViewDidUpdated else { return }
                
                    self.tabbleViewDidUpdated = true
                
                DispatchQueue.main.async {
                    self.saveDataToDataBase() // ***
                    //self.tableView.reloadData()
                }
                
                
                print(fetchedObject.articles[0].date)
            }
            catch {
                print("smt wrong while decoding")
            }

        }.resume()
    }

}



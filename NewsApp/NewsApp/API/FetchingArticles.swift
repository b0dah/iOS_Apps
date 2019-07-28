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
            "apiKey": "d8b23d8849114ea387fa690586fb7a57",
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
                let articles = try jsonDecoder.decode(FetchedObject.self, from: data)
                print("+", articles)
                print(articles.articles[0].imageUrl)
            }
            catch {
                print("smt wrong while decoding")
            }
            
        }.resume()
    }
    
}



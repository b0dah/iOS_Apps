//
//  ArticleClass.swift
//  NewsApp
//
//  Created by Иван Романов on 24/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class FetchedObject: Codable {
    let status: String
    let source: String
    let sortBy: String
    let articles: [Article]
    
    init(status: String, source: String, sortBy: String, articles: [Article]) {
        self.status = status
        self.source = source
        self.sortBy = sortBy
        self.articles = articles
    }
}

class Article: Codable {
    let headline : String
    let body: String
    let imageUrl: String
    let date: String
    
    enum  CodingKeys: String, CodingKey {
        case headline = "title"
        case body = "description"
        case imageUrl = "urlToImage"
        case date = "publishedAt"
    }
    
    init(headline: String, body: String, imageUrl: String, date: String) {
        self.headline = headline
        self.body = body
        self.imageUrl = imageUrl
        self.date = date
    }
}

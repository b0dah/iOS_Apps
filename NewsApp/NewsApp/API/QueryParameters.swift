//
//  QueryParameters.swift
//  NewsApp
//
//  Created by Иван Романов on 24/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

struct queryParameters {
    
    let baseUrl = URL(string: "https://newsapi.org/v1/articles")!
    let parameters : [String: String] = [
        "source": "techcrunch",
        "apiKey": "d8b23d8849114ea387fa690586fb7a57",
    ]
    
}


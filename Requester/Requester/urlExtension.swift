//
//  urlExtension.swift
//  Requester
//
//  Created by Иван Романов on 11.10.2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1) }
                return components?.url
    }
}

//
//  CodingUserInfoKeyExtension.swift
//  NewsApp
//
//  Created by Иван Романов on 29/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

public extension CodingUserInfoKey {
    // Helper property to retrieve the Core Data managed object context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

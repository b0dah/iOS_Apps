//
//  Painting+CoreDataClass.swift
//  ManualCoreData
//
//  Created by Иван Романов on 12.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData

public enum PaintingKeys {
    static let id = "id"
    static let title = "title"
    static let genre = ""
    static let image = ""
    static let imageName = ""
    static let details = "description" // !
    static let museumid = ""
}

@objc(Painting)
public class Painting: NSManagedObject {
}

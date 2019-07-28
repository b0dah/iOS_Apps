//
//  Article+CoreDataProperties.swift
//  NewsApp
//
//  Created by Иван Романов on 29/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var body: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var headline: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var fetchedObject: FetchedObject?

}

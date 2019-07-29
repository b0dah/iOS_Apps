//
//  ArticleEntity+CoreDataProperties.swift
//  NewsApp
//
//  Created by Иван Романов on 29/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension ArticleEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleEntity> {
        return NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
    }

    @NSManaged public var body: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var headline: String?
    @NSManaged public var imageUrl: String?

}

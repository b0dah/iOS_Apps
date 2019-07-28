//
//  FetchedObject+CoreDataProperties.swift
//  NewsApp
//
//  Created by Иван Романов on 29/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension FetchedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FetchedObject> {
        return NSFetchRequest<FetchedObject>(entityName: "FetchedObject")
    }

    @NSManaged public var status: String?
    @NSManaged public var article: NSSet?

}

// MARK: Generated accessors for article
extension FetchedObject {

    @objc(addArticleObject:)
    @NSManaged public func addToArticle(_ value: Article)

    @objc(removeArticleObject:)
    @NSManaged public func removeFromArticle(_ value: Article)

    @objc(addArticle:)
    @NSManaged public func addToArticle(_ values: NSSet)

    @objc(removeArticle:)
    @NSManaged public func removeFromArticle(_ values: NSSet)

}

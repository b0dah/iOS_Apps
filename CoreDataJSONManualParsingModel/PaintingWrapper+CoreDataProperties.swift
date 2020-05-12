//
//  PaintingWrapper+CoreDataProperties.swift
//  CoreDataJSONManualParsingModel
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension PaintingWrapper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaintingWrapper> {
        return NSFetchRequest<PaintingWrapper>(entityName: "PaintingWrapper")
    }

    @NSManaged public var paintings: NSSet

}

// MARK: Generated accessors for paintings
extension PaintingWrapper {

    @objc(addPaintingsObject:)
    @NSManaged public func addToPaintings(_ value: NSManagedObject)

    @objc(removePaintingsObject:)
    @NSManaged public func removeFromPaintings(_ value: NSManagedObject)

    @objc(addPaintings:)
    @NSManaged public func addToPaintings(_ values: NSSet)

    @objc(removePaintings:)
    @NSManaged public func removeFromPaintings(_ values: NSSet)

}

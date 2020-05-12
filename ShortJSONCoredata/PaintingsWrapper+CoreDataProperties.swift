//
//  PaintingsWrapper+CoreDataProperties.swift
//  ShortJSONCoredata
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension PaintingsWrapper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaintingsWrapper> {
        return NSFetchRequest<PaintingsWrapper>(entityName: "PaintingsWrapper")
    }

    @NSManaged public var paintings: NSSet?

}

// MARK: Generated accessors for paintings
extension PaintingsWrapper {

    @objc(addPaintingsObject:)
    @NSManaged public func addToPaintings(_ value: Painting)

    @objc(removePaintingsObject:)
    @NSManaged public func removeFromPaintings(_ value: Painting)

    @objc(addPaintings:)
    @NSManaged public func addToPaintings(_ values: NSSet)

    @objc(removePaintings:)
    @NSManaged public func removeFromPaintings(_ values: NSSet)

}

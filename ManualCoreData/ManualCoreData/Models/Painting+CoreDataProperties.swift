//
//  Painting+CoreDataProperties.swift
//  ManualCoreData
//
//  Created by Иван Романов on 13.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension Painting {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Painting> {
        return NSFetchRequest<Painting>(entityName: "Painting")
    }

    @NSManaged public var id: Int32
    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var author: Artist?

}

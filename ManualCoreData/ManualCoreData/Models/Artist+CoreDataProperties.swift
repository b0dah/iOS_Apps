//
//  Artist+CoreDataProperties.swift
//  ManualCoreData
//
//  Created by Иван Романов on 13.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData


extension Artist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Artist> {
        return NSFetchRequest<Artist>(entityName: "Artist")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?

}

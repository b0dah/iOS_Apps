//
//  Artist+CoreDataClass.swift
//  ManualCoreData
//
//  Created by Иван Романов on 13.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData

public enum ArtistKeys {    
    static let id = "id"
    static let name = "name"
}

@objc(Artist)
public class Artist: NSManagedObject {

}

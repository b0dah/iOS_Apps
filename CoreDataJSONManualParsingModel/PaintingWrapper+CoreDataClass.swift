//
//  PaintingWrapper+CoreDataClass.swift
//  CoreDataJSONManualParsingModel
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PaintingWrapper)
public class PaintingWrapper: NSManagedObject, Decodable {

    enum CodingKeys: String, CodingKey {
       case paintings = "paintings"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "PaintingWrapper", in: managedObjectContext)
            else {
                fatalError("Failed to decode painting!")
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)

        do {
            paintings = NSSet(array: try values.decode([Painting].self, forKey: .paintings))
        } catch {
            print("Error occured while decoding Fetched Wrapper Object")
        }
    }
    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        do {
//            try container.encode(paintings, forKey: .paintings)
//        } catch {
//
//        }
//    }
    
    
}

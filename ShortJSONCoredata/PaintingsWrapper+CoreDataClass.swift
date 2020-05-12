//
//  PaintingsWrapper+CoreDataClass.swift
//  ShortJSONCoredata
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PaintingsWrapper)
public class PaintingsWrapper: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
       case paintings = "paintings"
    }
        
    // MARK: - DECODABLE
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "PaintingsWrapper", in: managedObjectContext)
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
    
    // MARK: - ENCODABLE
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        do {
//            try container.encode(paintings , forKey: .paintings)
            try container.encodeIfPresent(paintings, forKey: .paintings)
        } catch {
            print("Error occure ecnoding Painting")
        }
    }

}

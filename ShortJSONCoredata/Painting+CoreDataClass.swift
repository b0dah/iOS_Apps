//
//  Painting+CoreDataClass.swift
//  ShortJSONCoredata
//
//  Created by Иван Романов on 10.05.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}



@objc(Painting)
public class Painting: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
    }
    
    // MARK: - DECODABLE
    public required convenience init(from decoder: Decoder) throws {
        guard let contextUserInfoKey = CodingUserInfoKey.context, let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Painting", in: managedObjectContext)
            else {
                fatalError("Failed to decode painting!")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = Int16(try values.decode(Int.self, forKey: .id) as! Int)
            title = try values.decode(String.self, forKey: .title)
        } catch {
            print("Error occured while decoding painting")
        }
        
        
    }
    
    // MARK: - ENCODABLE
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        do {
            try container.encode(id, forKey: .id)
            try container.encode(title, forKey: .title)
//            try container.encode(author, forKey: .author)

        } catch {
            print("Error occure ecnoding Painting")
        }
    }

}

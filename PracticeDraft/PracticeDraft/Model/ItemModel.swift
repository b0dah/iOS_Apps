//
//  ItemModel.swift
//  PracticeDraft
//
//  Created by Иван Романов on 16/07/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class Item: Codable {
    let id : Int
    let guid: String
    let name : String
    let beginDate : String
    let endDate: String
    let kind : Int
    let description : String?
    let imageId : Int?
    let venue: String
    let participant : [Participant]
    
    init(id: Int, guid: String, name: String, beginDate : String, endDate: String, kind : Int, description : String?, imageId : Int?, venue: String, participant : [Participant]) {
        self.id = id
        self.guid = guid
        self.name = name
        self.beginDate = beginDate
        self.endDate=endDate
        self.kind = kind
        self.description = description
        self.imageId = imageId
        self.venue = venue
        self.participant = participant
    }
}

class Participant: Codable {
    let surname : String?
    let name : String?
    let patronyc : String?
    let position : String?
    let company : String?
    let imageId : Int?
    
    init(surname : String?, name : String?, patronyc : String?, position : String?, company : String?, imageId : Int?) {
        self.surname = surname
        self.name = name
        self.patronyc = patronyc
        self.position = position
        self.company = company
        self.imageId = imageId
    }
}

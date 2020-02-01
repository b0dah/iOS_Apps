//
//  File.swift
//  PersonalityQuiz
//
//  Created by Иван Романов on 31.01.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: RespopnseType
    var answers: [Answer]
}

enum RespopnseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}
// •
enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "U R incredibly outgoing!"
        case .cat:
            return "U enjoy doing things on your own terms"
        case .rabbit:
            return "U like everything that's soft"
        case .turtle:
            return "U R wise beyound your years, and U focus on the details"
        }
    }
}



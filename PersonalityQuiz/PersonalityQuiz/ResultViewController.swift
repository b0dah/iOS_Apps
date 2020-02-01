//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Иван Романов on 31.01.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    

    func calculatePersonalityResult() {
        // which times user gamer voted for each personality
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        // collection of answer's animal types only
        let responseAnimalTypes = responses.map {$0.type}
        
        // calculting occurence value for each personality (key)
            // not a concise way:
        for animal in responseAnimalTypes {
            if let _ = frequencyOfAnswers[animal] {
                frequencyOfAnswers[animal]! += 1
            } else { frequencyOfAnswers[animal] = 1 }
            //            frequencyOfAnswers[animal] = (frequencyOfAnswers[animal] ?? 0) + 1
        }
        
            // not a concise way:
        // let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {
        //            (pair1, pair2) -> Bool in
        //            return pair1.value > pair2.value
        //        })
        //
        // let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        // Display data in the Labels
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}

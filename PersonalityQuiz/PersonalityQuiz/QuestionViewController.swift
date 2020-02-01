//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Иван Романов on 31.01.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: Data
    var questions: [Question] = [
        Question(text: "Which food do u like the most?", type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                ]),
        
        Question(text: "Which act do u enjoy?", type: .multiple, answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog),
        ]),
        
        Question(text: "How much do u enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
        ])
    ]
    
    var answersChosen: [Answer] = []
    
    // MARK: Outlets
    @IBOutlet weak var singleAnswerStackView: UIStackView!
    @IBOutlet weak var multipleAnswerStackView: UIStackView!
    @IBOutlet weak var rangedAnswerStackView: UIStackView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var singleAnswerButtons: [UIButton]!
    @IBOutlet var multipleAnswerLabels: [UILabel]!
    @IBOutlet var rangedAnswerLabels: [UILabel]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet var multipleAnswerSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    // MARK:- Submit Actions For All Question Types:
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        for i in singleAnswerButtons.indices {
            if sender == singleAnswerButtons[i] {
                answersChosen.append(currentAnswers[i])
            }
        }
        nextQuestion()
        print("CHSEN LIST: ", answersChosen)
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for i in multipleAnswerSwitches.indices {
            if multipleAnswerSwitches[i].isOn {
                answersChosen.append(currentAnswers[i])
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let indexChosen = Int( round(rangedSlider.value * Float(currentAnswers.count - 1)) ) // chosen answer's index = slider value * (number of answers - 1)
        
        answersChosen.append(currentAnswers[indexChosen])
        
        nextQuestion()
    }
    
    // MARK:- Vars
    var questionIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Updating
    func updateUI() {
        
        singleAnswerStackView.isHidden = true
        multipleAnswerStackView.isHidden = true
        rangedAnswerStackView.isHidden = true
        
        // Calculate values to display
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)

        // Display values
        self.navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleAnswerStack(using: currentAnswers)
        case .multiple:
            updateMultipleAnswerStack(using: currentAnswers)
        case .ranged:
            updateRangedAnswerStack(using: currentAnswers)
        }
    }
    
    func updateSingleAnswerStack(using answers: [Answer]) {
        singleAnswerStackView.isHidden = false

        for i in singleAnswerButtons.indices {
            singleAnswerButtons[i].setTitle(answers[i].text, for: .normal)
        }
    }
    
    func updateMultipleAnswerStack(using answers: [Answer]) {
        multipleAnswerStackView.isHidden = false
        
        // restore defaults
        for i in multipleAnswerSwitches {
            i.isOn = false
        }
        
        for i in multipleAnswerLabels.indices {
            multipleAnswerLabels[i].text = answers[i].text
        }
    }
    
    func updateRangedAnswerStack(using answers: [Answer]) {
        rangedAnswerStackView.isHidden = false
        
        // restore defaults
        rangedSlider.setValue(0.5, animated: false)
        
        rangedAnswerLabels[0].text = answers.first?.text
        rangedAnswerLabels[1].text = answers.last?.text
    }
   
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    // MARK:- preaprings to pass the responses
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultViewController
            
            // assigning data to results controller's property
            resultsViewController.responses = answersChosen
        }
    }

}

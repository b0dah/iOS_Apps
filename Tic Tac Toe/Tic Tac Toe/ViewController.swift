//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Иван Романов on 04/04/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ActivePlayer = 1
    var whoseCell = [0,0,0, 0,0,0, 0,0,0]
    
    var isGameActive = true
    let winningCombinations = [ [0,1,2], [3,4,5], [6,7,8],/**/ [0,3,6], [1,4,7], [2,5,8], /**/ [0,4,8], [2,4,6] ]
    

    @IBOutlet weak var gameResultLabel: UILabel!
    
    
    @IBAction func tapped(_ sender: AnyObject) {
        if whoseCell[sender.tag - 1] == 0 {
            
            whoseCell[sender.tag - 1 ] = ActivePlayer
            
            if ActivePlayer == 1 {
                sender.setImage(UIImage(named: "Cross.png")!, for: UIControl.State())
                
                 ActivePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                ActivePlayer = 1
            }
        }
        
        for combination in winningCombinations { // one comb, one row
            if (whoseCell[combination[0]] != 0) && whoseCell[combination[0]] == whoseCell[combination[1]] && whoseCell[combination[1]] == whoseCell[combination[2]] {
                
                isGameActive = false
                if whoseCell[combination[0]] == 1 {
                    gameResultLabel.text = "Croos has won"
                }
                else {
                    gameResultLabel.text = "Nought has won"
                }
                gameResultLabel.isHidden = false
                playAgainHandler.isHidden = false
            }
        }
        
        if isGameActive {
            isGameActive = false
            for cell in whoseCell {
                if cell == 0 {
                    isGameActive = true
                    break
                }
            }
        
                if !isGameActive {
                    gameResultLabel.text = "It was a draw!"
                    gameResultLabel.isHidden = false
                    playAgainHandler.isHidden = false
                }
            
        }
    }
    
    @IBOutlet weak var playAgainHandler: UIButton!
    @IBAction func playAgainAction(_ sender: UIButton) {
        ActivePlayer = 1
        whoseCell = [0,0,0, 0,0,0, 0,0,0]
        
        isGameActive = true
        
        gameResultLabel.isHidden = true
        playAgainHandler.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


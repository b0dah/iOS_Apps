//
//  GameScene.swift
//  FlappyJohnny
//
//  Created by Иван Романов on 20.09.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    lazy var birdie: SKSpriteNode! = {
        if let node = self.childNode(withName: "Birdie") as? SKSpriteNode {
            return node
        } else { print("Birdie Node is not found"); return SKSpriteNode() }
    } ()
    
    lazy var backgroundNode: SKNode! = {
        if let node = self.childNode(withName: "Back") {
            return node
        } else {
            print("Back Node is not found")
            return SKNode()
        }
    }()
    
    lazy var gameOverLabel: SKSpriteNode! = {
        if let node = self.childNode(withName: "GameOverLabele") as? SKSpriteNode {
            node.alpha = 0
            return node
        } else { print("GameOverLabel Node is not found"); return SKSpriteNode() }
    } ()
    
    private let moveBackgroundAction = SKAction.move(by: CGVector(dx: -500, dy: 0), duration: 10)

    
    override func didMove(to view: SKView) {
        
        // MARK:- initialization
        
        
        
        
        
        
        // MARK:- Delegate
        self.physicsWorld.contactDelegate = self
        
        
        
        backgroundNode.run(moveBackgroundAction)
    }
    
    // MARK:- Private Methods
    private func stopGame() {
        backgroundNode.removeAllActions()
        birdie.physicsBody?.pinned = true
        gameOverLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    // MARK:- Handlers
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdie.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 4))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
    
    
}

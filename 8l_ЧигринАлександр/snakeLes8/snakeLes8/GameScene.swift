//
//  GameScene.swift
//  snakeLes8
//
//  Created by Александр Чигрин on 15.11.2021.
//

import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0 // 0001
    static let SNakeHEad: UInt32 = 0x1 << 1 // 0010
    static let APple: UInt32 = 0x1 << 2 // 0100
    static let EdgeBody: UInt32 = 0x1 << 3 // 1000
}

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true
        
        let counterClockWiseButton = SKShapeNode()
        counterClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockWiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockWiseButton.fillColor = .magenta
        counterClockWiseButton.strokeColor = .magenta
        counterClockWiseButton.lineWidth = 10
        
        counterClockWiseButton.name = "counterClockWiseButton"
        self.addChild(counterClockWiseButton)
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        clockWiseButton.fillColor = .magenta
        clockWiseButton.strokeColor = .magenta
        clockWiseButton.lineWidth = 10
        
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake |
        CollisionCategories.SNakeHEad
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            
            touchNode.fillColor = .green
            
            if touchNode.name == "counterClockWiseButton" {
                snake!.moveCounterClockWise()
            } else if touchNode.name == "clockWiseButton" {
                snake!.moveClockwise()
            }
        }
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            
            touchNode.fillColor = .magenta
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        snake!.move()
    }


    func createApple() {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)))

        let apple = Apple(position: CGPoint(x: randX, y: randY))
        
        self.addChild(apple)
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodies = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodies - CollisionCategories.SNakeHEad
        
        switch collisionObject {
            
        case CollisionCategories.APple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
            
        case CollisionCategories.EdgeBody:
            let scene = GameScene(size: self.size)
            let a = SKTransition.crossFade(withDuration: 0.5)
            self.view?.presentScene(scene, transition: a)
            
            break           
            
        default:
            break
            
        }
    }
    
}

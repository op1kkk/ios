//
//  SnakeHead.swift
//  snakeLes8
//
//  Created by Александр Чигрин on 15.11.2021.
//

import Foundation
import SpriteKit

class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SNakeHEad
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody |
        CollisionCategories.Snake | CollisionCategories.APple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  GameScene.swift
//  Greeps
//
//  Created by Jason Oswald on 3/31/17.
//  Copyright © 2017 CS. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    var ship: Ship = Ship()
    var greepsToSpawn = [Greep]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var lastGreepAddTime: TimeInterval = 0
    
    override func sceneDidLoad() {

    }
    
    override func didMove(to view: SKView) {
        self.lastUpdateTime = 0        
        entities.append(ship)
        addChild(ship.sprite!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if greepsToSpawn.count > 0 && currentTime - lastGreepAddTime > 1
        {
            let greep = greepsToSpawn.removeFirst()
            entities.append(greep)
            addChild(greep.sprite!)
            lastGreepAddTime = currentTime
        }
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            if let greep = entity as? Greep
            {
                print( "pre entity update \(greep.position)")
                entity.update(deltaTime: dt)
                print( "post entity update \(greep.position)")
            }
        }
        
        self.lastUpdateTime = currentTime
    }
}

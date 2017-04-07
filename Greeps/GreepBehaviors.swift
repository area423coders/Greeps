//
//  GreepBehaviors.swift
//  Greeps
//
//  Created by Jason Oswald on 4/3/17.
//  Copyright © 2017 CS. All rights reserved.
//

import Foundation
import GameplayKit

class DefaultGreepBahaviour: GKBehavior
{
    override init() {
        super.init()
        setWeight(1.0, for: GKGoal(toWander: Greep.wanderAmount))
        setWeight(1.0, for: GKGoal(toReachTargetSpeed: Greep.defaultSpeed))
    }
}

class ReturnHomeGreepBehavior: GKBehavior
{
    init( ship: Ship )
    {
        super.init()
        setWeight(0.1, for: GKGoal(toWander: Greep.wanderAmount))
        setWeight(1.0, for: GKGoal(toSeekAgent: ship.agent))
    }
}

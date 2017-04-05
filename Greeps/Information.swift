//
//  Information.swift
//  Greeps
//
//  Created by Jason Oswald on 3/31/17.
//  Copyright © 2017 CS. All rights reserved.
//

import Foundation
import GameplayKit

class Information: Hashable
{
    let info: Any
    let isTomato: Bool
    let isObstacle: Bool
    
    var hashValue: Int
    {
        if isObstacle
        {
            return (info as! GKObstacle).hashValue
        }
        else
        {
            return (info as! GKEntity).hashValue
        }
    }
    
    init?( info: Any )
    {
        if let obstacle = info as? GKObstacle
        {
            self.info = obstacle
            isTomato = false
            isObstacle = true
        }
        else if let tomato = info as? GKEntity
        {
            self.info = tomato
            isTomato = true
            isObstacle = false
        }
        else
        {
            return nil
        }
    }
}
extension Information: Equatable
{
    static func ==(lhs: Information, rhs: Information) -> Bool
    {
        if((lhs.isTomato && rhs.isTomato) || (lhs.isObstacle && rhs.isObstacle))
        {
            if lhs.isTomato
            {
                return (lhs.info as! GKEntity) == (rhs.info as! GKEntity)
            }
            else
            {
                return (lhs.info as! GKObstacle) == (rhs.info as! GKObstacle)
            }
        }
        else
        {
            return false
        }
    }
}

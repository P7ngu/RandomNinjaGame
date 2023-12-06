//
//  CgFloat+Ext.swift
//  RandomGame
//
//  Created by Matteo Perotta on 05/12/23.
//

import CoreGraphics

public let π = CGFloat.pi


extension CGFloat {
    
    func radiansToDegrees() -> CGFloat {
        return self * 100.0 / π
    }
    
    func degreesToRadians() -> CGFloat {
        return self * π / 180.0
    }
    
    static func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFFF)) //return 0, 1
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat{
        assert(min < max)
        return CGFloat.random() * (max - min) + min //return min or max
    }
}

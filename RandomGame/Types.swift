//
//  Types.swift
//  RandomGame
//
//  Created by Matteo Perotta on 10/12/23.
//

import Foundation


struct PhysicsCategory {
    static let Player:      UInt32 = 0b1 // -> 2 ^ 0
    static let Block:      UInt32 = 0b10 // -> 2 ^ 1
    static let Obstacle:      UInt32 = 0b100 // -> 2 ^ 2
    static let Ground:      UInt32 = 0b1000 // -> 2 ^ 3
    static let Coin:      UInt32 = 0b10000 // -> 2 ^ 4
}

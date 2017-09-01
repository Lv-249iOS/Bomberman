//
//  Upgrade.swift
//  BomberMan
//
//  Created by Yaroslav Luchyt on 8/26/17.
//  Copyright © 2017 Lv-249 iOS. All rights reserved.
//

import Foundation

struct Block {
    var explodable = false
    var flyable = false
    var walkable = false
}

struct Scene {
    var data = ""
    var width = 0
}

struct Player {
//    var health = 1
    var markForScene: Character = "0"
    var canFly = false
    var minesCount = 1
    var explosionPower = 1
//    var speed = 1
}

struct Explosion {
    var top = 0
    var bottom = 0
    var left = 0
    var right = 0
}

struct Enemy {
    var speed = 1
    var canFly = false
}

enum Direction: Int {
    case top = 1
    case bottom = 4
    case left  = 2
    case right = 3
}

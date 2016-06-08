//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


typealias Distance = Double

struct Position {
    var x:Double
    var y:Double
}

extension Position {
    func inRange(range:Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}

struct Ship {
    var position:Position
    var firingRange:Distance
    var unsafeRange:Distance
}

extension Ship {
    func canEngageShip(target:Ship) -> Bool {
        let dx = target.position.x
        let dy = target.position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange
    }
    
    func canSafelyEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }
    
    func canSafelyEngageShip1(target: Ship, friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx * friendlyDx +
            friendlyDy * friendlyDy)
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && (friendlyDistance > unsafeRange)
    }
    
    func canSafelyEngageShip2(target: Ship, friendly: Ship) -> Bool {
        print(position)
        let targetDistance = target.position.minus(position).length
        let friendlyDistance = friendly.position.minus(position).length
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && (friendlyDistance > unsafeRange)
    }
}

extension Position {
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double {
        return sqrt(x * x + y * y)
    }
}

typealias Region = Position -> Bool

func circle(radius: Distance) -> Region {
    return { point in point.length <= radius }
}

func circle2(radius:Distance,center:Position) -> Region {
    return {point in point.minus(center).length <= radius}
}

func shift(region:Region,offset:Position) -> Region {
    return {point in region(point.minus(offset))}
}
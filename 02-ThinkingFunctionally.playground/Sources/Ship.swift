//: # Prelude

import Foundation

//: # Thinking Functionally
//: ## Example: Battleship

public typealias Distance = Double

public struct Position {
  var x: Double
  var y: Double
  
  public init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
}


extension Position {
  func inRange(_ range: Distance) -> Bool {
    return sqrt(x * x + y * y) <= range
  }
}

public struct Ship {
  var position: Position
  var firingRange: Distance
  var unsafeRange: Distance
  
  public init(position: Position, firingRange: Distance, unsafeRange: Distance) {
    self.position = position
    self.firingRange = firingRange
    self.unsafeRange = unsafeRange
  }
}

// p.16
//extension Ship {
//  public func canEngageShip(_ target: Ship) -> Bool {
//    let dx = target.position.x - position.x
//    let dy = target.position.y - position.y
//    let targetDistance = sqrt(dx * dx + dy * dy)
//    return targetDistance <= firingRange
//  }
//}

// p.17
//extension Ship {
//  public func canSafelyEngageShip(_ target: Ship) -> Bool {
//    let dx = target.position.x - position.x
//    let dy = target.position.y - position.y
//    let targetDistance = sqrt(dx * dx + dy * dy)
//    return targetDistance <= firingRange && targetDistance > unsafeRange
//  }
//}

// p.18
//extension Ship {
//  public func canSafelyEngageShip1(_ target: Ship, friendly: Ship) -> Bool {
//    let dx = target.position.x - position.x
//    let dy = target.position.y - position.y
//    let targetDistance = sqrt(dx * dx + dy * dy)
//    let friendlyDx = friendly.position.x - target.position.x
//    let friendlyDy = friendly.position.y - target.position.y
//    let friendlyDistance = sqrt(friendlyDx * friendlyDx +
//      friendlyDy * friendlyDy)
//    return targetDistance <= firingRange
//      && targetDistance > unsafeRange
//      && (friendlyDistance > unsafeRange)
//  }
//}

// p.19
//extension Position {
//  func minus(_ p: Position) -> Position {
//    return Position(x: x - p.x, y: y - p.y)
//  }
//  var length: Double {
//    return sqrt(x * x + y * y)
//  }
//}

// p.19
//extension Ship {
//  public func canSafelyEngageShip2(_ target: Ship, friendly: Ship) -> Bool {
//    let targetDistance = target.position.minus(position).length
//    let friendlyDistance = friendly.position.minus(target.position).length
//    return targetDistance <= firingRange
//      && targetDistance > unsafeRange
//      && (friendlyDistance > unsafeRange)
//  }
//}

//: ## First-Class Functions

// p.20
//typealias Region = (Position) -> Bool

// p.21
//func circle(_ radius: Distance) -> Region {
//  return { point in point.length <= radius }
//}

// p.21
//func circle2(_ radius: Distance, center: Position) -> Region {
//  return { point in point.minus(center).length <= radius }
//}

// p.21
//func shift(_ region: @escaping Region, offset: Position) -> Region {
//  return { point in region(point.minus(offset)) }
//}

// p.22
//func invert(_ region: @escaping Region) -> Region {
//  return { point in !region(point) }
//}

// p.22
//func intersection(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
//  return { point in region1(point) && region2(point) }
//}

// p.22
//func union(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
//  return { point in region1(point) || region2(point) }
//}

// p.23
//func difference(_ region: @escaping Region, minus: @escaping Region) -> Region {
//  return intersection(invert(minus), region)
//}

// p.23
//extension Ship {
//  public func canSafelyEngageShip(_ target: Ship, friendly: Ship) -> Bool {
//    let rangeRegion = difference(circle(firingRange),
//                                 minus: circle(unsafeRange))
//    let firingRegion = shift(rangeRegion, offset: position)
//    let friendlyRegion = shift(circle(unsafeRange),
//                               offset: friendly.position)
//    let resultRegion = difference(firingRegion, minus: friendlyRegion)
//    return resultRegion(target.position)
//  }
//}

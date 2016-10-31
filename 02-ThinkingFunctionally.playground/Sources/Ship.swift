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

extension Ship {
  func canEngageShip(_ target: Ship) -> Bool {
    let dx = target.position.x - position.x
    let dy = target.position.y - position.y
    let targetDistance = sqrt(dx * dx + dy * dy)
    return targetDistance <= firingRange
  }
}


extension Ship {
  func canSafelyEngageShip(_ target: Ship) -> Bool {
    let dx = target.position.x - position.x
    let dy = target.position.y - position.y
    let targetDistance = sqrt(dx * dx + dy * dy)
    return targetDistance <= firingRange && targetDistance > unsafeRange
  }
}


extension Ship {
  func canSafelyEngageShip1(_ target: Ship, friendly: Ship) -> Bool {
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
}


extension Position {
  func minus(_ p: Position) -> Position {
    return Position(x: x - p.x, y: y - p.y)
  }
  var length: Double {
    return sqrt(x * x + y * y)
  }
}


extension Ship {
  func canSafelyEngageShip2(_ target: Ship, friendly: Ship) -> Bool {
    let targetDistance = target.position.minus(position).length
    let friendlyDistance = friendly.position.minus(target.position).length
    return targetDistance <= firingRange
      && targetDistance > unsafeRange
      && (friendlyDistance > unsafeRange)
  }
}

//: ## First-Class Functions

typealias Region = (Position) -> Bool


func circle(_ radius: Distance) -> Region {
  return { point in point.length <= radius }
}


func circle2(_ radius: Distance, center: Position) -> Region {
  return { point in point.minus(center).length <= radius }
}


func shift(_ region: @escaping Region, offset: Position) -> Region {
  return { point in region(point.minus(offset)) }
}


func invert(_ region: @escaping Region) -> Region {
  return { point in !region(point) }
}


func intersection(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
  return { point in region1(point) && region2(point) }
}

func union(_ region1: @escaping Region, _ region2: @escaping Region) -> Region {
  return { point in region1(point) || region2(point) }
}


func difference(_ region: @escaping Region, minus: @escaping Region) -> Region {
  return intersection(invert(minus), region)
}


extension Ship {
  func canSafelyEngageShip(_ target: Ship, friendly: Ship) -> Bool {
    let rangeRegion = difference(circle(firingRange),
                                 minus: circle(unsafeRange))
    let firingRegion = shift(rangeRegion, offset: position)
    let friendlyRegion = shift(circle(unsafeRange),
                               offset: friendly.position)
    let resultRegion = difference(firingRegion, minus: friendlyRegion)
    return resultRegion(target.position)
  }
}


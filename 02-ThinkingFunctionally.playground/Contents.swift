import Foundation


let position = Position(x: 0, y: 0)
let ship = Ship(position: position, firingRange: 10, unsafeRange: 2)

let preview = drawShip(ship: ship)

import Foundation


let position = Position(x: 0, y: 10)
let ship = Ship(position: position, firingRange: 100, unsafeRange: 40)


let friendly = Ship(position: position, firingRange: 100, unsafeRange: 40)

let preview = drawShip(ship: ship)
//let preview = drawShip(ship: ship, friendly: friendly)

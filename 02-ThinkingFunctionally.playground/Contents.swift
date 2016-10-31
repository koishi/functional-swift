import Foundation

// 自艦
let shipPosition = Position(x: 0, y: 10)
let ship = Ship(position: shipPosition, firingRange: 100, unsafeRange: 40)

// 僚艦
let friendlyShipPosition = Position(x: 100, y: 100)
let friendlyShip = Ship(position: friendlyShipPosition, firingRange: 100, unsafeRange: 40)

// 敵艦
let targetShipPosition = Position(x: 0, y: 0)
let targetShip = Ship(position: targetShipPosition, firingRange: 100, unsafeRange: 40)

let preview = draw(ship: ship, friendly: friendlyShip, target: targetShip)


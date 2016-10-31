import Foundation
import UIKit

// フィールドサイズ
let size = CGSize(width: 320, height: 320)

// 自艦
let shipPosition = Position(x: 0, y: 0)
let ship = Ship(position: shipPosition, firingRange: 100, unsafeRange: 0)

// 僚艦
let friendlyShip: Ship? = nil
//let friendlyShipPosition = Position(x: 100, y: 100)
//let friendlyShip = Ship(position: friendlyShipPosition, firingRange: 0, unsafeRange: 40)

// 敵艦
let targetShip: Ship? = nil
//let targetShipPosition = Position(x: 80, y: 80)
//let targetShip = Ship(position: targetShipPosition, firingRange: 0, unsafeRange: 0)

// 描写
let preview = draw(size: size, ship: ship, friendly: friendlyShip, target: targetShip)


// p.16
//ship.canEngageShip(targetShip)

// p.17
//ship.canSafelyEngageShip(targetShip)

// p.18
//ship.canSafelyEngageShip1(targetShip, friendly: friendlyShip)

// p.23
//ship.canSafelyEngageShip(targetShip, friendly: friendlyShip)

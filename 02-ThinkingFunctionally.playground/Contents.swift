import Foundation
import UIKit

// フィールドサイズ
let size = CGSize(width: 320, height: 320)

// 自艦
let shipPosition = Position(x: 30, y: 30)
let ship = Ship(position: shipPosition, firingRange: 100, unsafeRange: 40)

// 僚艦
let friendlyShipPosition = Position(x: 100, y: 100)
let friendlyShip = Ship(position: friendlyShipPosition, firingRange: 100, unsafeRange: 40)

// 敵艦
let targetShipPosition = Position(x: -50, y: -50)
let targetShip = Ship(position: targetShipPosition, firingRange: 100, unsafeRange: 40)

// 描写
let preview = draw(size: size, ship: ship, friendly: friendlyShip, target: targetShip)


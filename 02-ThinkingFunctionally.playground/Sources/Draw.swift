import UIKit

public func draw(size: CGSize, ship: Ship, friendly: Ship?, target: Ship?) -> UIView {

  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0)

  drawField(size: size)
  drawShip(size: size, ship: ship)

  if let _ = friendly {
    drawfriendlyShip(size: size, ship: friendly!)
  }

  if let _ = target {
    drawTargetShip(size: size, ship: target!)
  }

  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
  UIGraphicsEndImageContext()

  return view
}

// フィールドを書く
func drawField(size: CGSize) {
  drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.width, y: size.height / 2))
  drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: size.height))
}

// 自艦を描く
func drawShip(size: CGSize, ship: Ship) {
  let shipCenterPoint = CGPoint(x: size.width / 2 + CGFloat(ship.position.x), y: size.height / 2 + CGFloat(ship.position.y) * -1)
  drawCircle(arcCenter: shipCenterPoint, radius: CGFloat(ship.firingRange), color: UIColor.green.withAlphaComponent(0.5))
  drawCircle(arcCenter: shipCenterPoint, radius: CGFloat(ship.unsafeRange), color: UIColor.red.withAlphaComponent(0.5))
  drawCircle(arcCenter: shipCenterPoint, radius: 4, color: UIColor.blue)
}

// 僚艦を描く
func drawfriendlyShip(size: CGSize, ship: Ship) {
  let shipCenterPoint = CGPoint(x: size.width / 2 + CGFloat(ship.position.x), y: size.height / 2 + CGFloat(ship.position.y) * -1)
  drawCircle(arcCenter: shipCenterPoint, radius: CGFloat(ship.unsafeRange), color: UIColor.red.withAlphaComponent(0.5))
  drawCircle(arcCenter: shipCenterPoint, radius: 4, color: UIColor.green)
}

// 敵艦を描く
func drawTargetShip(size: CGSize, ship: Ship) {
  let shipCenterPoint = CGPoint(x: size.width / 2 + CGFloat(ship.position.x), y: size.height / 2 + CGFloat(ship.position.y) * -1)
  drawCircle(arcCenter: shipCenterPoint, radius: 4, color: UIColor.red)
}

// 直線を描く
func drawLine(from: CGPoint, to: CGPoint) {
  let path_line = UIBezierPath();
  path_line.move(to: from);
  path_line.addLine(to: to);
  UIColor.black.withAlphaComponent(0.5).setStroke();
  path_line.stroke();
}

// 円を描く
func drawCircle(arcCenter: CGPoint, radius: CGFloat, color: UIColor) {
  let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
  UIColor.black.setStroke()
  path.lineWidth = 2
  color.setFill()
  path.stroke()
  path.fill()
}

import UIKit

//public func draw() -> UIView {
//  
//  // ビューのサイズ
//  let size = CGSize(width: 300, height: 300)
//  
//  // UIViewを生成
//  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
//  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
//  
//  // CoreGraphicsで描画する
//  UIGraphicsBeginImageContextWithOptions(size, false, 0)
//  
//  // 描画する
//  let path = UIBezierPath()
//  path.move(to: CGPoint(x:50, y:100))
//  path.addLine(to: CGPoint(x:150, y:100))
//  UIColor.orange.setStroke()
//  path.stroke()
//  
//  UIColor.blue.setStroke()
//  var shift = 0
//  let delta = 15
//  while shift <= 300 {
//    var path2 = UIBezierPath()
//    let t = CGFloat(shift)
//    path2.move(to: CGPoint(x:t, y:300))
//    path2.addLine(to: CGPoint(x:0, y:t))
//    path2.stroke()
//    
//    // move our shift a little bit
//    shift += delta
//  }
//  
//  // viewのlayerに描画したものをセットする
//  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
//  
//  UIGraphicsEndImageContext()
//  
//  // PlaygroundのTimelineに表示するためのview
//  return view
//}

public func drawShip(ship: Ship) -> UIView {
  
  // UIViewを生成
  let size = CGSize(width: 320, height: 320)
  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
  
  // CoreGraphicsで描画する
  UIGraphicsBeginImageContextWithOptions(size, false, 0)

  let shipCenterPoint = CGPoint(x: size.width / 2 + CGFloat(ship.position.x), y: size.height / 2 + CGFloat(ship.position.y) * -1)

  // firingRangeを描写
  let firingRange = UIBezierPath(arcCenter: shipCenterPoint, radius: CGFloat(ship.firingRange),  startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
  UIColor.blue.setStroke()
  firingRange.lineWidth = 2
  UIColor.green.setFill()
  firingRange.stroke()
  firingRange.fill()

  // unsafeRangeを描写
  let unsafeRange = UIBezierPath(arcCenter: shipCenterPoint, radius: CGFloat(ship.unsafeRange),  startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
  UIColor.blue.setStroke()
  unsafeRange.lineWidth = 2
  UIColor.red.setFill()
  unsafeRange.stroke()
  unsafeRange.fill()

  // 船の中心を描写
  let center = UIBezierPath(arcCenter: shipCenterPoint, radius: 2,  startAngle: 0, endAngle: CGFloat(M_PI) * 2, clockwise: true)
  UIColor.black.setStroke();
  center.lineWidth = 4
  center.stroke()

  // 上下の線を描写
  drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.width, y: size.height / 2))
  drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: size.height))

  // viewのlayerに描画したものをセットする
  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
  
  UIGraphicsEndImageContext()
  
  // PlaygroundのTimelineに表示するためのview
  return view
}

// 直線を書く
func drawLine(from: CGPoint, to: CGPoint) {
  let path_line = UIBezierPath();
  path_line.move(to: from);
  path_line.addLine(to: to);
  UIColor.black.setStroke();
  path_line.stroke();
}


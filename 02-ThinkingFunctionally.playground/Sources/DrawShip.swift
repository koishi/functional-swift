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

  let size = CGSize(width: 320, height: 320)
  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0)

  let shipCenterPoint = CGPoint(x: size.width / 2 + CGFloat(ship.position.x), y: size.height / 2 + CGFloat(ship.position.y) * -1)

  // firingRangeを描写
  drawCircle(arcCenter: shipCenterPoint, radius: CGFloat(ship.firingRange), color: UIColor.green)

  // unsafeRangeを描写
  drawCircle(arcCenter: shipCenterPoint, radius: CGFloat(ship.unsafeRange), color: UIColor.red)

  // 船の中心を描写
  drawCircle(arcCenter: shipCenterPoint, radius: 2, color: UIColor.black)

  // 上下の線を描写
  drawLine(from: CGPoint(x: 0, y: size.height / 2), to: CGPoint(x: size.width, y: size.height / 2))
  drawLine(from: CGPoint(x: size.width / 2, y: 0), to: CGPoint(x: size.width / 2, y: size.height))

  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
  UIGraphicsEndImageContext()

  return view
}

// 直線を描く
func drawLine(from: CGPoint, to: CGPoint) {
  let path_line = UIBezierPath();
  path_line.move(to: from);
  path_line.addLine(to: to);
  UIColor.black.setStroke();
  path_line.stroke();
}

// 円を描く
func drawCircle(arcCenter: CGPoint, radius: CGFloat, color: UIColor) {
  let path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
  UIColor.blue.setStroke()
  path.lineWidth = 2
  color.setFill()
  path.stroke()
  path.fill()
}

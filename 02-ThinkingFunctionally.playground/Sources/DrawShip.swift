import UIKit

public func draw() -> UIView {
  
  // ビューのサイズ
  let size = CGSize(width: 300, height: 300)
  
  // UIViewを生成
  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
  
  // CoreGraphicsで描画する
  UIGraphicsBeginImageContextWithOptions(size, false, 0)
  
  // 描画する
  let path = UIBezierPath()
  path.move(to: CGPoint(x:50, y:100))
  path.addLine(to: CGPoint(x:150, y:100))
  UIColor.orange.setStroke()
  path.stroke()
  
  UIColor.blue.setStroke()
  var shift = 0
  let delta = 15
  while shift <= 300 {
    var path2 = UIBezierPath()
    let t = CGFloat(shift)
    path2.move(to: CGPoint(x:t, y:300))
    path2.addLine(to: CGPoint(x:0, y:t))
    path2.stroke()
    
    // move our shift a little bit
    shift += delta
  }
  
  // viewのlayerに描画したものをセットする
  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
  
  UIGraphicsEndImageContext()
  
  // PlaygroundのTimelineに表示するためのview
  return view
}

public func drawShip(ship: Ship) -> UIView {
  
  // ビューのサイズ
  let size = CGSize(width: 300, height: 300)

  // UIViewを生成
  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
  view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
  
  // CoreGraphicsで描画する
  UIGraphicsBeginImageContextWithOptions(size, false, 0)
  
  // 描画する
  let path = UIBezierPath()
  path.move(to: CGPoint(x:50, y:100))
  path.addLine(to: CGPoint(x:150, y:100))
  UIColor.orange.setStroke()
  path.stroke()
  
  UIColor.blue.setStroke()
  var shift = 0
  let delta = 15
  while shift <= 300 {
    var path2 = UIBezierPath()
    let t = CGFloat(shift)
    path2.move(to: CGPoint(x:t, y:300))
    path2.addLine(to: CGPoint(x:0, y:t))
    path2.stroke()
    
    // move our shift a little bit
    shift += delta
  }
  
  // viewのlayerに描画したものをセットする
  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
  
  UIGraphicsEndImageContext()
  
  // PlaygroundのTimelineに表示するためのview
  return view
}

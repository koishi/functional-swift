//import Foundation
//import UIKit
//
//
//let position = Position(x: 0, y: 0)
//print(position)
//
//let ship = Ship(position: position, firingRange: 10, unsafeRange: 2)
//
//print(ship)
//
//func drawShip(ship: Ship) {
//
//  //1.view作成
//  let size = CGSize(width: 150, height: 150)
//  let view:UIView = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
//  UIGraphicsBeginImageContextWithOptions(size, false, 0);//描画開始
//
//  //2.丸作成
//  let bounds:CGRect = CGRect(x: 0, y: 0, width: 150, height: 150)
//  var center = CGPoint()
//  center.x = bounds.origin.x + bounds.size.width / 2.0;
//  center.y = bounds.origin.y + bounds.size.height / 2.0;
//  let radius = (min(bounds.size.width, bounds.size.height) / 2.0);
//  let path:UIBezierPath = UIBezierPath();
//  path.addArc(withCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true);
//  UIColorFromRGB(rgbValue: 0xfde9ac).setFill();
//  path.stroke();//枠線
//  path.fill();//色
//
//  //3.viewに反映
//  view.layer.contents = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
//  UIGraphicsEndImageContext()
//
//  //4.selfにview追加
////  view.addSubview(view);
//}
//
//
//func UIColorFromRGB(rgbValue: UInt) -> UIColor {
//  return UIColor(
//    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//    alpha: CGFloat(1.0)
//  )
//}
//
//drawShip(ship: ship)
//
//


import UIKit

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
let preview = view

import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
XCPlaygroundPage.currentPage.liveView = preview


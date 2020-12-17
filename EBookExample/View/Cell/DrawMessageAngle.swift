//
//  DrawMessageAngle.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/16.
//

import UIKit

func drawMessageAngle(messageBubble: UIView, isSelf: Bool, bubbleColor: CGColor) {
    
    let bubbleWidth = messageBubble.frame.width
    var basePoint: CGFloat
    var displacement: CGFloat
    
    if isSelf == true {
        basePoint = bubbleWidth + 10
        displacement = -10
    } else {
        basePoint = -10
        displacement = 10
    }
    
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: basePoint, y: 0))
    bezierPath.addQuadCurve(to: CGPoint(x: basePoint + 2*displacement, y: 10), controlPoint: CGPoint(x: basePoint + displacement, y: 10))
    bezierPath.addLine(to: CGPoint(x: basePoint + 2*displacement, y: 20))
    bezierPath.addQuadCurve(to: CGPoint(x: basePoint, y: 0), controlPoint: CGPoint(x: basePoint + displacement, y: 20))
    
    let messageAngleLayer = CAShapeLayer()
    messageAngleLayer.path = bezierPath.cgPath
    messageAngleLayer.fillColor = bubbleColor
    
    messageBubble.layer.addSublayer(messageAngleLayer)
    
}

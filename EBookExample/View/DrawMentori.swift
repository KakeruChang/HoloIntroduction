//
//  DrawMentori.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/22.
//

import SwiftUI

func DrawMentori(uiView: UIView,red: CGFloat,green: CGFloat,  blue: CGFloat,device:String,imgOpacity: CGFloat) {
    
    let mainColor =  CGColor(srgbRed: red, green: green, blue: blue, alpha: imgOpacity)
    uiView.layer.sublayers?.first?.removeFromSuperlayer()
    
    // remove old layer
    uiView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    
    
    // body
    let bodyLine = UIBezierPath()
    bodyLine.move(to: CGPoint(x: 174, y: 49))
    bodyLine.addQuadCurve(to: CGPoint(x: 133, y: 146), controlPoint: CGPoint(x: 98, y: 86))
    bodyLine.addLine(to: CGPoint(x: 143, y: 132))
    // right wing
    bodyLine.addCurve(to: CGPoint(x: 144, y: 177), controlPoint1: CGPoint(x: 95, y:195),controlPoint2: CGPoint(x: 110, y:230))
    bodyLine.addQuadCurve(to: CGPoint(x: 129, y: 198), controlPoint: CGPoint(x: 137, y: 188))
    bodyLine.addCurve(to: CGPoint(x: 160, y: 186), controlPoint1: CGPoint(x: 122, y:209),controlPoint2: CGPoint(x: 135, y:218))
    bodyLine.addQuadCurve(to: CGPoint(x: 145, y: 203), controlPoint: CGPoint(x: 153, y: 195))
    bodyLine.addCurve(to: CGPoint(x: 192, y: 175), controlPoint1: CGPoint(x: 144, y:205),controlPoint2: CGPoint(x: 145, y:223))
    bodyLine.addLine(to: CGPoint(x: 179, y: 188))
    // leg
    bodyLine.addQuadCurve(to: CGPoint(x: 237, y: 202), controlPoint: CGPoint(x: 201, y: 208))
    bodyLine.addQuadCurve(to: CGPoint(x: 273, y: 184), controlPoint: CGPoint(x: 270, y: 215))
    bodyLine.addLine(to: CGPoint(x: 310, y: 159))
    bodyLine.addCurve(to: CGPoint(x: 322, y: 136), controlPoint1: CGPoint(x: 340, y:162),controlPoint2: CGPoint(x: 332, y:142))
    bodyLine.addCurve(to: CGPoint(x:259, y: 69), controlPoint1: CGPoint(x: 312, y:92),controlPoint2: CGPoint(x: 260, y:76))
    bodyLine.addQuadCurve(to: CGPoint(x: 205, y: 46), controlPoint: CGPoint(x: 238, y: 49))
    let bodyLayer = CAShapeLayer()
    bodyLayer.path = bodyLine.cgPath
    
    let bodyGradientLayer = CAGradientLayer()
    bodyGradientLayer.colors = [CGColor(red: 181/255, green: 181/255, blue: 206/255, alpha: 1), mainColor]
    bodyGradientLayer.borderColor = UIColor.black.cgColor
    bodyGradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 476)
    uiView.layer.addSublayer(bodyGradientLayer)
    bodyGradientLayer.mask = bodyLayer
    
    let bodyOutlineLayer = CAShapeLayer()
    bodyOutlineLayer.path = bodyLine.cgPath
    bodyOutlineLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    bodyOutlineLayer.fillColor = UIColor.clear.cgColor
    bodyOutlineLayer.lineWidth = 2
    uiView.layer.addSublayer(bodyOutlineLayer)
    
    // mouth
    let mouthLine = UIBezierPath()
    mouthLine.move(to: CGPoint(x: 180, y: 70))
    mouthLine.addCurve(to: CGPoint(x: 207, y: 59), controlPoint1: CGPoint(x: 152, y:48),controlPoint2: CGPoint(x: 210, y:27))
    mouthLine.addCurve(to: CGPoint(x: 184, y: 78), controlPoint1: CGPoint(x: 224, y:75),controlPoint2: CGPoint(x: 190, y:88))
    mouthLine.addCurve(to: CGPoint(x: 207, y: 59), controlPoint1: CGPoint(x: 170, y:65),controlPoint2: CGPoint(x: 199, y:52))
    let mouthLayer = CAShapeLayer()
    mouthLayer.path = mouthLine.cgPath
    mouthLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    mouthLayer.fillColor = CGColor(srgbRed: 255/255, green: 242/255, blue: 137/255, alpha: imgOpacity)
    mouthLayer.lineWidth = 2
    uiView.layer.addSublayer(mouthLayer)
    
    // eye
    let eyeWhiteLine = UIBezierPath()
    eyeWhiteLine.move(to: CGPoint(x: 151, y: 68))
    eyeWhiteLine.addCurve(to: CGPoint(x: 170, y: 98), controlPoint1: CGPoint(x: 170, y:58),controlPoint2: CGPoint(x: 186, y:88))
    eyeWhiteLine.addCurve(to: CGPoint(x: 151, y: 68), controlPoint1: CGPoint(x: 156, y:109),controlPoint2: CGPoint(x: 134, y:80))
    let eyeWhiteLayer = CAShapeLayer()
    eyeWhiteLayer.path = eyeWhiteLine.cgPath
    eyeWhiteLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    eyeWhiteLayer.fillColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: imgOpacity)
    eyeWhiteLayer.lineWidth = 2
    uiView.layer.addSublayer(eyeWhiteLayer)
    let eyeBlackLine = UIBezierPath()
    eyeBlackLine.move(to: CGPoint(x: 155, y: 72))
    eyeBlackLine.addCurve(to: CGPoint(x: 166, y: 94), controlPoint1: CGPoint(x: 166, y:67),controlPoint2: CGPoint(x: 180, y:86))
    eyeBlackLine.addCurve(to: CGPoint(x: 155, y: 72), controlPoint1: CGPoint(x: 156, y:100),controlPoint2: CGPoint(x: 142, y:78))
    let eyeBlackLayer = CAShapeLayer()
    eyeBlackLayer.path = eyeBlackLine.cgPath
    eyeBlackLayer.fillColor = CGColor(srgbRed: 0, green: 0, blue:0, alpha: imgOpacity)
    uiView.layer.addSublayer(eyeBlackLayer)
    
    //left foot
    let rightFootLine = UIBezierPath()
    rightFootLine.move(to: CGPoint(x: 260, y: 197))
    rightFootLine.addLine(to: CGPoint(x: 284, y: 207))
    rightFootLine.addLine(to: CGPoint(x: 278, y: 187))
    rightFootLine.move(to: CGPoint(x: 284, y: 207))
    rightFootLine.addLine(to: CGPoint(x: 290, y: 186))
    rightFootLine.move(to: CGPoint(x: 284, y: 207))
    rightFootLine.addLine(to: CGPoint(x: 299, y: 194))
    rightFootLine.move(to: CGPoint(x: 284, y: 207))
    rightFootLine.addLine(to: CGPoint(x: 286, y: 216))
    let rightFootLayer = CAShapeLayer()
    rightFootLayer.path = rightFootLine.cgPath
    rightFootLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    rightFootLayer.lineWidth = 2
    rightFootLayer.fillColor = UIColor.clear.cgColor
    uiView.layer.addSublayer(rightFootLayer)
    // left foot
    let leftFootLine = UIBezierPath()
    leftFootLine.move(to: CGPoint(x: 324, y: 149))
    leftFootLine.addLine(to: CGPoint(x: 346, y: 153))
    leftFootLine.addLine(to: CGPoint(x: 349, y: 166))
    leftFootLine.move(to: CGPoint(x: 346, y: 153))
    leftFootLine.addLine(to: CGPoint(x: 354, y: 135))
    leftFootLine.move(to: CGPoint(x: 346, y: 153))
    leftFootLine.addLine(to: CGPoint(x: 347, y: 129))
    leftFootLine.move(to: CGPoint(x: 346, y: 153))
    leftFootLine.addLine(to: CGPoint(x: 338, y: 132))
    let leftFootLayer = CAShapeLayer()
    leftFootLayer.path = leftFootLine.cgPath
    leftFootLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    leftFootLayer.lineWidth = 2
    leftFootLayer.fillColor = UIColor.clear.cgColor
    uiView.layer.addSublayer(leftFootLayer)
    
    if(device == "cellphone"){
        let cellphoneLine = UIBezierPath()
        cellphoneLine.move(to: CGPoint(x: 219, y: 14))
        cellphoneLine.addLine(to: CGPoint(x: 193, y: 21))
        cellphoneLine.addQuadCurve(to: CGPoint(x: 190, y: 26), controlPoint: CGPoint(x: 188, y: 24))
        cellphoneLine.addLine(to: CGPoint(x: 212, y: 75))
        cellphoneLine.addQuadCurve(to: CGPoint(x: 218, y: 77), controlPoint: CGPoint(x: 213, y: 78))
        cellphoneLine.addLine(to: CGPoint(x: 246, y: 69))
        cellphoneLine.addQuadCurve(to: CGPoint(x: 247, y: 62), controlPoint: CGPoint(x: 249, y: 65))
        cellphoneLine.addLine(to: CGPoint(x: 227, y: 18))
        cellphoneLine.addQuadCurve(to: CGPoint(x: 219, y: 14), controlPoint: CGPoint(x: 225, y: 12))
        let cellphoneLayer = CAShapeLayer()
        cellphoneLayer.path = cellphoneLine.cgPath
        cellphoneLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        cellphoneLayer.lineWidth = 2
        cellphoneLayer.fillColor = CGColor(srgbRed: 50/255, green: 49/255, blue: 53/255, alpha: imgOpacity)
        uiView.layer.addSublayer(cellphoneLayer)
    }
    if(device == "star"){
        let starLine = UIBezierPath()
        starLine.move(to: CGPoint(x: 219, y: 14))
        starLine.addLine(to: CGPoint(x: 212, y: 35))
        starLine.addLine(to: CGPoint(x: 190, y: 35))
        starLine.addLine(to: CGPoint(x: 205, y: 56))
        starLine.addLine(to: CGPoint(x: 198, y: 77))
        starLine.addLine(to: CGPoint(x: 219, y: 63))
        starLine.addLine(to: CGPoint(x: 240, y: 77))
        starLine.addLine(to: CGPoint(x: 233, y: 56))
        starLine.addLine(to: CGPoint(x: 248, y: 35))
        starLine.addLine(to: CGPoint(x: 226, y: 35))
        starLine.close()
        let starLayer = CAShapeLayer()
        starLayer.path = starLine.cgPath
        starLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        starLayer.lineWidth = 2
        starLayer.fillColor = UIColor.red.cgColor
        uiView.layer.addSublayer(starLayer)
    }
    if(device == "book"){
        let bookLine = UIBezierPath()
        bookLine.move(to: CGPoint(x: 209, y: 14))
        bookLine.addQuadCurve(to: CGPoint(x: 237, y: 6), controlPoint: CGPoint(x: 217, y: -7))
        bookLine.addLine(to: CGPoint(x: 257, y: 60))
        bookLine.addQuadCurve(to: CGPoint(x: 229, y: 68), controlPoint: CGPoint(x: 237, y: 55))
        bookLine.addLine(to: CGPoint(x: 191, y: 76))
        bookLine.addLine(to: CGPoint(x: 171, y: 22))
        bookLine.addLine(to: CGPoint(x: 209, y: 14))
        bookLine.addLine(to: CGPoint(x: 229, y: 68))
        let bookLayer = CAShapeLayer()
        bookLayer.path = bookLine.cgPath
        bookLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        bookLayer.lineWidth = 2
        bookLayer.fillColor = UIColor.green.cgColor
        uiView.layer.addSublayer(bookLayer)
    }
    if(device == "ruler"){
        let rulerLine = UIBezierPath()
        rulerLine.move(to: CGPoint(x: 225, y: 12))
        rulerLine.addLine(to: CGPoint(x: 265, y: 100))
        rulerLine.addLine(to: CGPoint(x: 237, y: 108))
        rulerLine.addLine(to: CGPoint(x: 197, y: 20))
        rulerLine.close()
        rulerLine.move(to: CGPoint(x: 230, y: 23))
        rulerLine.addLine(to: CGPoint(x: 216, y: 27))
        rulerLine.move(to: CGPoint(x: 235, y: 34))
        rulerLine.addLine(to: CGPoint(x: 228, y: 36))
        rulerLine.move(to: CGPoint(x: 240, y: 45))
        rulerLine.addLine(to: CGPoint(x: 233, y: 47))
        rulerLine.move(to: CGPoint(x: 245, y: 56))
        rulerLine.addLine(to: CGPoint(x: 231, y: 60))
        rulerLine.move(to: CGPoint(x: 250, y: 67))
        rulerLine.addLine(to: CGPoint(x: 243, y: 69))
        rulerLine.move(to: CGPoint(x: 255, y: 78))
        rulerLine.addLine(to: CGPoint(x: 248, y: 80))
        rulerLine.move(to: CGPoint(x: 260, y: 89))
        rulerLine.addLine(to: CGPoint(x: 246, y: 93))
        let rulerLayer = CAShapeLayer()
        rulerLayer.path = rulerLine.cgPath
        rulerLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        rulerLayer.lineWidth = 2
        rulerLayer.fillColor = UIColor.white.cgColor
        uiView.layer.addSublayer(rulerLayer)
    }
    
    // left wing
    let leftWingLine = UIBezierPath()
    leftWingLine.move(to: CGPoint(x: 285, y: 87))
    // leftWingLine.addQuadCurve(to: CGPoint(x: 229, y: 24), controlPoint: CGPoint(x: 289, y: 21))
    leftWingLine.addCurve(to: CGPoint(x: 229, y: 25), controlPoint1: CGPoint(x: 292, y:56),controlPoint2: CGPoint(x: 270, y:18))
    leftWingLine.addCurve(to: CGPoint(x: 254, y: 44), controlPoint1: CGPoint(x: 220, y:25),controlPoint2: CGPoint(x: 210, y:46))
    leftWingLine.addQuadCurve(to: CGPoint(x: 228, y: 41), controlPoint: CGPoint(x: 239, y: 43))
    leftWingLine.addCurve(to: CGPoint(x: 257, y: 56), controlPoint1: CGPoint(x: 227, y:52),controlPoint2: CGPoint(x: 242, y:56))
    leftWingLine.addLine(to: CGPoint(x: 240, y: 54))
    leftWingLine.addCurve(to: CGPoint(x: 260, y: 68), controlPoint1: CGPoint(x: 237, y:64),controlPoint2: CGPoint(x: 251, y:66))
    leftWingLine.addQuadCurve(to: CGPoint(x: 263, y: 73), controlPoint: CGPoint(x: 260, y: 72))
    leftWingLine.close()
    let leftWingLayer = CAShapeLayer()
    leftWingLayer.path = leftWingLine.cgPath
    
    
    let leftWingGradientLayer = CAGradientLayer()
    leftWingGradientLayer.colors = [CGColor(red: 181/255, green: 181/255, blue: 206/255, alpha: 1), mainColor]
    leftWingGradientLayer.borderColor = UIColor.black.cgColor
    leftWingGradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 476)
    uiView.layer.addSublayer(leftWingGradientLayer)
    leftWingGradientLayer.mask = leftWingLayer
    
    let leftWingOutlineLayer = CAShapeLayer()
    leftWingOutlineLayer.path = leftWingLine.cgPath
    leftWingOutlineLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
    leftWingOutlineLayer.fillColor = UIColor.clear.cgColor
    leftWingOutlineLayer.lineWidth = 2
    uiView.layer.addSublayer(leftWingOutlineLayer)
}

//
//  DrawChika.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/23.
//

import SwiftUI

func drawLuster(startX: Int, startY: Int, endX: Int,endY: Int, controlX: Int,controlY: Int, lusterColor: CGColor, lusterWidth: CGFloat, uiView: UIView){
    let luster = UIBezierPath()
    luster.move(to: CGPoint(x: startX, y: startY))
    luster.addQuadCurve(to: CGPoint(x: endX, y: endY), controlPoint: CGPoint(x: controlX, y:controlY))
    let lusterLayer = CAShapeLayer()
    lusterLayer.path = luster.cgPath
    lusterLayer.strokeColor = lusterColor
    lusterLayer.fillColor = UIColor.clear.cgColor
    lusterLayer.lineWidth = lusterWidth
    uiView.layer.addSublayer(lusterLayer)
}

func drawAllLuster(uiView: UIView){
    let lusterColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6).cgColor
    drawLuster(startX: 105, startY: 89, endX: 91, endY: 127, controlX: 97, controlY: 105, lusterColor: lusterColor, lusterWidth: 2, uiView: uiView)
    drawLuster(startX: 109, startY: 95, endX: 95, endY: 135, controlX: 102, controlY: 110, lusterColor: lusterColor, lusterWidth: 3, uiView: uiView)
    drawLuster(startX: 112, startY: 105, endX: 101, endY: 143, controlX: 106, controlY: 120, lusterColor: lusterColor, lusterWidth: 3, uiView: uiView)
    drawLuster(startX: 144, startY: 111, endX: 140, endY: 140, controlX: 140, controlY: 125, lusterColor: lusterColor, lusterWidth: 1, uiView: uiView)
    drawLuster(startX: 287, startY: 111, endX: 290, endY: 144, controlX: 289, controlY: 125, lusterColor: lusterColor, lusterWidth: 2, uiView: uiView)
    drawLuster(startX: 324, startY: 120, endX: 331, endY: 157, controlX: 327, controlY: 130, lusterColor: lusterColor, lusterWidth: 3.5, uiView: uiView)
    drawLuster(startX: 330, startY: 109, endX: 337, endY: 150, controlX: 333, controlY: 125, lusterColor: lusterColor, lusterWidth: 3.5, uiView: uiView)
    drawLuster(startX: 334, startY: 96, endX: 342, endY: 140, controlX: 338, controlY: 110, lusterColor: lusterColor, lusterWidth: 3.5, uiView: uiView)
}

func drawLine(startX: Int, startY: Int, endX: Int,endY: Int, color: CGColor, width: CGFloat, uiView: UIView){
    let straightLine = UIBezierPath()
    straightLine.move(to: CGPoint(x: startX, y: startY))
    straightLine.addLine(to: CGPoint(x: endX, y: endY))
    let straightLineLayer = CAShapeLayer()
    straightLineLayer.path = straightLine.cgPath
    straightLineLayer.strokeColor = color
    straightLineLayer.fillColor = UIColor.clear.cgColor
    straightLineLayer.lineWidth = width
    uiView.layer.addSublayer(straightLineLayer)
}

func drawFlush(uiView: UIView){
    drawLine(startX: 142, startY: 266, endX: 141, endY: 273, color: UIColor(red: 244/255, green: 220/255, blue: 208/255, alpha: 1).cgColor, width: 2, uiView: uiView)
    drawLine(startX: 152, startY: 265, endX: 151, endY: 274, color: UIColor(red: 250/255, green: 220/255, blue: 210/255, alpha: 1).cgColor, width: 2, uiView: uiView)
    drawLine(startX: 159, startY: 266, endX: 158, endY: 276, color: UIColor(red: 250/255, green: 226/255, blue: 214/255, alpha: 1).cgColor, width: 2, uiView: uiView)
    drawLine(startX: 265, startY: 264, endX: 266, endY: 275, color: UIColor(red: 245/255, green: 228/255, blue: 213/255, alpha: 1).cgColor, width: 2, uiView: uiView)
    drawLine(startX: 272, startY: 263, endX: 274, endY: 277, color: UIColor(red: 237/255, green: 213/255, blue: 201/255, alpha: 1).cgColor, width: 2, uiView: uiView)
    drawLine(startX: 281, startY: 263, endX: 285, endY: 280, color: UIColor(red: 241/255, green: 211/255, blue: 201/255, alpha: 1).cgColor, width: 2, uiView: uiView)
}

func drawChikaRightEye(uiView: UIView, imgOpacity: CGFloat, lineColor: CGColor, eyeColor: UBColor){
    // eyewhite
    let rightEyeWhiteLine = UIBezierPath()
    rightEyeWhiteLine.move(to: CGPoint(x: 122, y: 224))
    rightEyeWhiteLine.addQuadCurve(to: CGPoint(x: 177, y: 204), controlPoint: CGPoint(x: 140, y:188))
    rightEyeWhiteLine.addQuadCurve(to: CGPoint(x: 170, y: 248), controlPoint: CGPoint(x: 183, y:230))
    rightEyeWhiteLine.addQuadCurve(to: CGPoint(x: 122, y: 224), controlPoint: CGPoint(x: 136, y:259))
    
    let rightEyeWhiteLayer = CAShapeLayer()
    rightEyeWhiteLayer.path = rightEyeWhiteLine.cgPath
    rightEyeWhiteLayer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(rightEyeWhiteLayer)
    
    // eyebrow
    let rightEyebrowLine = UIBezierPath()
    rightEyebrowLine.move(to: CGPoint(x: 118, y: 229))
    rightEyebrowLine.addLine(to: CGPoint(x: 120, y: 219))
    rightEyebrowLine.addQuadCurve(to: CGPoint(x: 179, y: 196), controlPoint: CGPoint(x: 140, y:184))
    rightEyebrowLine.addLine(to: CGPoint(x: 173, y: 195))
    rightEyebrowLine.addLine(to: CGPoint(x: 179, y: 204))
    rightEyebrowLine.addQuadCurve(to: CGPoint(x: 118, y: 229), controlPoint: CGPoint(x: 142, y:189))
    let rightEyebrowLayer = CAShapeLayer()
    rightEyebrowLayer.path = rightEyebrowLine.cgPath
    rightEyebrowLayer.strokeColor = lineColor
    rightEyebrowLayer.fillColor = lineColor
    rightEyebrowLayer.lineWidth = 1
    uiView.layer.addSublayer(rightEyebrowLayer)
    
    // eyedark
    let rightEyeDark = UIBezierPath()
    rightEyeDark.move(to: CGPoint(x: 138, y: 224))
    rightEyeDark.addCurve(to: CGPoint(x: 175, y: 224), controlPoint1: CGPoint(x: 138, y:195),controlPoint2: CGPoint(x: 175, y:195))
    rightEyeDark.addCurve(to: CGPoint(x: 138, y: 224), controlPoint1: CGPoint(x: 179, y:258),controlPoint2: CGPoint(x: 134, y:258))
    let rightEyeDarkLayer = CAShapeLayer()
    rightEyeDarkLayer.path = rightEyeDark.cgPath
    rightEyeDarkLayer.strokeColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: imgOpacity*0.5).cgColor
    rightEyeDarkLayer.fillColor = UIColor(red: eyeColor.red*0.5, green: eyeColor.green*0.5, blue: eyeColor.blue*0.5, alpha: imgOpacity).cgColor
    rightEyeDarkLayer.lineWidth = 2
    uiView.layer.addSublayer(rightEyeDarkLayer)
    // eyelight
    let rightEyeLight = UIBezierPath()
    rightEyeLight.move(to: CGPoint(x: 142, y: 236))
    rightEyeLight.addCurve(to: CGPoint(x: 173, y: 233), controlPoint1: CGPoint(x: 142, y:220),controlPoint2: CGPoint(x: 176, y:220))
    rightEyeLight.addCurve(to: CGPoint(x: 142, y: 236), controlPoint1: CGPoint(x: 176, y:252),controlPoint2: CGPoint(x: 140, y:253))
    let rightEyeLightLayer = CAShapeLayer()
    rightEyeLightLayer.path = rightEyeLight.cgPath
    rightEyeLightLayer.fillColor = UIColor(red: eyeColor.red, green: eyeColor.green, blue: eyeColor.blue, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(rightEyeLightLayer)
    
    drawLuster(startX: 151, startY: 239, endX: 165, endY: 239, controlX: 159, controlY: 245, lusterColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, lusterWidth: 1, uiView: uiView)
    
    // eyeblack
    let rightEyeBlack = UIBezierPath()
    rightEyeBlack.move(to: CGPoint(x: 150, y: 230))
    rightEyeBlack.addCurve(to: CGPoint(x: 165, y: 229), controlPoint1: CGPoint(x: 149, y:217),controlPoint2: CGPoint(x: 165, y:217))
    rightEyeBlack.addCurve(to: CGPoint(x: 150, y: 230), controlPoint1: CGPoint(x: 166, y:239),controlPoint2: CGPoint(x: 151, y:239))
    let rightEyeBlackLayer = CAShapeLayer()
    rightEyeBlackLayer.path = rightEyeBlack.cgPath
    rightEyeBlackLayer.fillColor = UIColor(red: 111/255, green: 81/255, blue: 112/255, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(rightEyeBlackLayer)

    drawLine(startX: 158, startY: 225, endX: 158, endY: 220, color: UIColor(red: eyeColor.red*0.5, green: eyeColor.green*0.5, blue: eyeColor.blue*0.5, alpha: imgOpacity).cgColor, width: 2, uiView: uiView)
    
    // eyeflash
    drawLine(startX: 173, startY: 237, endX: 171, endY: 235, color: UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor, width: 2.5, uiView: uiView)
    
    let rightEyeFlash1 = UIBezierPath()
    rightEyeFlash1.move(to: CGPoint(x: 141, y: 215))
    rightEyeFlash1.addCurve(to: CGPoint(x: 151, y: 216), controlPoint1: CGPoint(x: 142, y:206),controlPoint2: CGPoint(x: 152, y:206))
    rightEyeFlash1.addCurve(to: CGPoint(x: 141, y: 215), controlPoint1: CGPoint(x: 149, y:222),controlPoint2: CGPoint(x: 139, y:221))
    let rightEyeFlash1Layer = CAShapeLayer()
    rightEyeFlash1Layer.path = rightEyeFlash1.cgPath
    rightEyeFlash1Layer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor //.2
    uiView.layer.addSublayer(rightEyeFlash1Layer)
    
    let rightEyeFlash2 = UIBezierPath()
    rightEyeFlash2.move(to: CGPoint(x: 147, y: 222))
    rightEyeFlash2.addCurve(to: CGPoint(x: 152, y: 222), controlPoint1: CGPoint(x: 145, y:217),controlPoint2: CGPoint(x: 153, y:217))
    rightEyeFlash2.addCurve(to: CGPoint(x: 147, y: 222), controlPoint1: CGPoint(x: 152, y:224),controlPoint2: CGPoint(x: 146, y:224))
    let rightEyeFlash2Layer = CAShapeLayer()
    rightEyeFlash2Layer.path = rightEyeFlash2.cgPath
    rightEyeFlash2Layer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(rightEyeFlash2Layer)

}

func drawChikaLeftEye(uiView: UIView, imgOpacity: CGFloat, lineColor: CGColor, eyeColor: UBColor){
    // eyewhite
    let leftEyeWhiteLine = UIBezierPath()
    leftEyeWhiteLine.move(to: CGPoint(x: 302, y: 221))
    leftEyeWhiteLine.addQuadCurve(to: CGPoint(x: 251, y: 204), controlPoint: CGPoint(x: 275, y:185))
    leftEyeWhiteLine.addQuadCurve(to: CGPoint(x: 268, y: 251), controlPoint: CGPoint(x: 240, y:250))
    leftEyeWhiteLine.addQuadCurve(to: CGPoint(x: 302, y: 221), controlPoint: CGPoint(x: 299, y:250))
    let leftEyeWhiteLayer = CAShapeLayer()
    leftEyeWhiteLayer.path = leftEyeWhiteLine.cgPath
    leftEyeWhiteLayer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(leftEyeWhiteLayer)
    
    // eyebrow
    let leftEyebrowLine = UIBezierPath()
    leftEyebrowLine.move(to: CGPoint(x: 306, y: 225))
    leftEyebrowLine.addCurve(to: CGPoint(x: 247, y: 199), controlPoint1: CGPoint(x: 296, y:194),controlPoint2: CGPoint(x: 260, y:184))
    leftEyebrowLine.addQuadCurve(to: CGPoint(x: 243, y: 208), controlPoint: CGPoint(x: 249, y:202))
    leftEyebrowLine.addQuadCurve(to: CGPoint(x: 306, y: 225), controlPoint: CGPoint(x: 275, y:185))
    let leftEyebrowLayer = CAShapeLayer()
    leftEyebrowLayer.path = leftEyebrowLine.cgPath
    leftEyebrowLayer.fillColor = lineColor
    uiView.layer.addSublayer(leftEyebrowLayer)


    // eyedark
    let leftEyeDark = UIBezierPath()
    leftEyeDark.move(to: CGPoint(x: 250, y: 224))
    leftEyeDark.addCurve(to: CGPoint(x: 287, y: 224), controlPoint1: CGPoint(x: 248, y:197),controlPoint2: CGPoint(x: 285, y:195))
    leftEyeDark.addCurve(to: CGPoint(x: 250, y: 224), controlPoint1: CGPoint(x: 291, y:260),controlPoint2: CGPoint(x: 246, y:258))
    
    let leftEyeDarkLayer = CAShapeLayer()
    leftEyeDarkLayer.path = leftEyeDark.cgPath
    leftEyeDarkLayer.strokeColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: imgOpacity*0.5).cgColor
    leftEyeDarkLayer.fillColor = UIColor(red: eyeColor.red*0.5, green: eyeColor.green*0.5, blue: eyeColor.blue*0.5, alpha: imgOpacity).cgColor
    leftEyeDarkLayer.lineWidth = 2
    uiView.layer.addSublayer(leftEyeDarkLayer)
    
    // eyelight
    let leftEyeLight = UIBezierPath()
    leftEyeLight.move(to: CGPoint(x: 253, y: 236))
    leftEyeLight.addCurve(to: CGPoint(x: 285, y: 233), controlPoint1: CGPoint(x: 251, y:217),controlPoint2: CGPoint(x: 287, y:220))
    leftEyeLight.addCurve(to: CGPoint(x: 253, y: 236), controlPoint1: CGPoint(x: 285, y:253),controlPoint2: CGPoint(x: 255, y:253))
    
    let leftEyeLightLayer = CAShapeLayer()
    leftEyeLightLayer.path = leftEyeLight.cgPath
    leftEyeLightLayer.fillColor = UIColor(red: eyeColor.red, green: eyeColor.green, blue: eyeColor.blue, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(leftEyeLightLayer)

    drawLuster(startX: 262, startY: 239, endX: 276, endY: 239, controlX: 270, controlY: 245, lusterColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, lusterWidth: 1, uiView: uiView)

    // eyeblack
    let leftEyeBlack = UIBezierPath()
    leftEyeBlack.move(to: CGPoint(x: 261, y: 230))
    leftEyeBlack.addCurve(to: CGPoint(x: 277, y: 229), controlPoint1: CGPoint(x: 260, y:217),controlPoint2: CGPoint(x: 276, y:216))
    leftEyeBlack.addCurve(to: CGPoint(x: 261, y: 230), controlPoint1: CGPoint(x: 276, y:239),controlPoint2: CGPoint(x: 262, y:239))
    let leftEyeBlackLayer = CAShapeLayer()
    leftEyeBlackLayer.path = leftEyeBlack.cgPath
    leftEyeBlackLayer.fillColor = UIColor(red: 111/255, green: 81/255, blue: 112/255, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(leftEyeBlackLayer)

    drawLine(startX: 269, startY: 225, endX: 269, endY: 220, color: UIColor(red: eyeColor.red*0.5, green: eyeColor.green*0.5, blue: eyeColor.blue*0.5, alpha: imgOpacity).cgColor, width: 2, uiView: uiView)

//            // eyeflash
    drawLine(startX: 285, startY: 236, endX: 284, endY: 234, color: UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor, width: 2.5, uiView: uiView)

    let leftEyeFlash1 = UIBezierPath()
    leftEyeFlash1.move(to: CGPoint(x: 254, y: 215))
    leftEyeFlash1.addCurve(to: CGPoint(x: 264, y: 216), controlPoint1: CGPoint(x: 252, y:205),controlPoint2: CGPoint(x: 265, y:204))
    leftEyeFlash1.addCurve(to: CGPoint(x: 254, y: 215), controlPoint1: CGPoint(x: 260, y:222),controlPoint2: CGPoint(x: 257, y:221))
    let leftEyeFlash1Layer = CAShapeLayer()
    leftEyeFlash1Layer.path = leftEyeFlash1.cgPath
    leftEyeFlash1Layer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(leftEyeFlash1Layer)

    let leftEyeFlash2 = UIBezierPath()
    leftEyeFlash2.move(to: CGPoint(x: 261, y: 222))
    leftEyeFlash2.addCurve(to: CGPoint(x: 265, y: 221), controlPoint1: CGPoint(x: 258, y:217),controlPoint2: CGPoint(x: 266, y:213))
    leftEyeFlash2.addCurve(to: CGPoint(x: 261, y: 222), controlPoint1: CGPoint(x: 263, y:223),controlPoint2: CGPoint(x: 262, y:222))
    let leftEyeFlash2Layer = CAShapeLayer()
    leftEyeFlash2Layer.path = leftEyeFlash2.cgPath
    leftEyeFlash2Layer.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: imgOpacity).cgColor
    uiView.layer.addSublayer(leftEyeFlash2Layer)
}

func addShadowLayer(shadow: UIBezierPath, opacity: CGFloat, uiView: UIView, depth: CGFloat = 1){
    let shadowLayer = CAShapeLayer()
    shadowLayer.path = shadow.cgPath
    
    shadowLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: opacity*depth).cgColor
    uiView.layer.addSublayer(shadowLayer)
}

func drawShadow(uiView: UIView, shadowOpacity: CGFloat){
    // neck
    let shadow1 = UIBezierPath()
    shadow1.move(to: CGPoint(x: 139, y: 317))
    shadow1.addQuadCurve(to: CGPoint(x: 146, y: 383), controlPoint: CGPoint(x: 159, y:360))
    shadow1.addQuadCurve(to: CGPoint(x: 216, y: 420), controlPoint: CGPoint(x: 173, y:419))
    shadow1.addQuadCurve(to: CGPoint(x: 287, y: 375), controlPoint: CGPoint(x: 243, y:417))
    shadow1.addQuadCurve(to: CGPoint(x: 283, y: 315), controlPoint: CGPoint(x: 276, y:365))
    shadow1.addQuadCurve(to: CGPoint(x: 225, y: 354), controlPoint: CGPoint(x: 258, y:335))
    shadow1.addQuadCurve(to: CGPoint(x: 208, y: 355), controlPoint: CGPoint(x: 224, y:356))
    shadow1.addQuadCurve(to: CGPoint(x: 139, y: 317), controlPoint: CGPoint(x: 185, y:343))
    addShadowLayer(shadow: shadow1, opacity: shadowOpacity, uiView: uiView)
    
    // left hair
    let shadow2 = UIBezierPath()
    shadow2.move(to: CGPoint(x: 115, y: 362))
    shadow2.addLine(to: CGPoint(x: 83, y: 369))
    shadow2.addQuadCurve(to: CGPoint(x: 58, y: 414), controlPoint: CGPoint(x: 58, y:363))
    shadow2.addQuadCurve(to: CGPoint(x: 56, y: 443), controlPoint: CGPoint(x: 57, y:436))
    shadow2.addCurve(to: CGPoint(x: 69, y: 272), controlPoint1: CGPoint(x: 5, y:408),controlPoint2: CGPoint(x: 20, y:328))
    shadow2.addQuadCurve(to: CGPoint(x: 51, y: 330), controlPoint: CGPoint(x: 60, y:305))
    shadow2.addLine(to: CGPoint(x: 83, y: 263))
    shadow2.addQuadCurve(to: CGPoint(x: 102, y: 310), controlPoint: CGPoint(x: 93, y:292))
    shadow2.addCurve(to: CGPoint(x: 115, y: 362), controlPoint1: CGPoint(x: 117, y:336),controlPoint2: CGPoint(x: 119, y:355))
    addShadowLayer(shadow: shadow2, opacity: shadowOpacity, uiView: uiView)
    
    let shadow3 = UIBezierPath()
    shadow3.move(to: CGPoint(x: 132, y: 366))
    shadow3.addLine(to: CGPoint(x: 134, y: 359))
    shadow3.addLine(to: CGPoint(x: 138, y: 357))
    shadow3.addCurve(to: CGPoint(x: 98, y: 275), controlPoint1: CGPoint(x: 131, y:333),controlPoint2: CGPoint(x: 114, y:320))
    shadow3.addCurve(to: CGPoint(x: 132, y: 366), controlPoint1: CGPoint(x: 102, y:307),controlPoint2: CGPoint(x: 133, y:346))
    addShadowLayer(shadow: shadow3, opacity: shadowOpacity, uiView: uiView)
    
    // right hair
    let shadow4 = UIBezierPath()
    shadow4.move(to: CGPoint(x: 304, y: 363))
    shadow4.addLine(to: CGPoint(x: 291, y: 359))
    shadow4.addQuadCurve(to: CGPoint(x: 297, y: 327), controlPoint: CGPoint(x: 290, y:345))
    shadow4.addQuadCurve(to: CGPoint(x: 304, y: 363), controlPoint: CGPoint(x: 299, y:345))
    addShadowLayer(shadow: shadow4, opacity: shadowOpacity, uiView: uiView)
    
    let shadow5 = UIBezierPath()
    shadow5.move(to: CGPoint(x: 326, y: 367))
    shadow5.addQuadCurve(to: CGPoint(x: 317, y: 332), controlPoint: CGPoint(x: 321, y:345))
    shadow5.addQuadCurve(to: CGPoint(x: 352, y: 240), controlPoint: CGPoint(x: 322, y:315))
    shadow5.addCurve(to: CGPoint(x: 374, y: 446), controlPoint1: CGPoint(x: 348, y:300),controlPoint2: CGPoint(x: 440, y:364))
    shadow5.addQuadCurve(to: CGPoint(x: 373, y: 386), controlPoint: CGPoint(x: 376, y:415))
    shadow5.addQuadCurve(to: CGPoint(x: 354, y: 374), controlPoint: CGPoint(x: 375, y:375))
    addShadowLayer(shadow: shadow5, opacity: shadowOpacity, uiView: uiView)
    
    // eye
    let shadow6 = UIBezierPath()
    shadow6.move(to: CGPoint(x: 121, y: 226))
    shadow6.addCurve(to: CGPoint(x: 174, y: 202), controlPoint1: CGPoint(x: 135, y:199),controlPoint2: CGPoint(x: 164, y:197))
    shadow6.addLine(to: CGPoint(x: 179, y: 213))
    shadow6.addCurve(to: CGPoint(x: 121, y: 226), controlPoint1: CGPoint(x: 165, y:198),controlPoint2: CGPoint(x: 145, y:200))
    addShadowLayer(shadow: shadow6, opacity: shadowOpacity, uiView: uiView)
    
    let shadow7 = UIBezierPath()
    shadow7.move(to: CGPoint(x: 301, y: 226))
    shadow7.addCurve(to: CGPoint(x: 248, y: 210), controlPoint1: CGPoint(x: 302, y:204),controlPoint2: CGPoint(x: 255, y:189))
    shadow7.addCurve(to: CGPoint(x: 301, y: 226), controlPoint1: CGPoint(x: 270, y:195),controlPoint2: CGPoint(x: 287, y:212))
    addShadowLayer(shadow: shadow7, opacity: shadowOpacity, uiView: uiView)
    
    // maegami
    let shadow8 = UIBezierPath()
    shadow8.move(to: CGPoint(x: 310, y: 125))
    shadow8.addQuadCurve(to: CGPoint(x: 310, y: 193), controlPoint: CGPoint(x: 315, y:165))
    shadow8.addQuadCurve(to: CGPoint(x: 314, y: 238), controlPoint: CGPoint(x: 314, y:215))
    shadow8.addQuadCurve(to: CGPoint(x: 310, y: 125), controlPoint: CGPoint(x: 329, y:195))
    addShadowLayer(shadow: shadow8, opacity: shadowOpacity, uiView: uiView)
    
    let shadow9 = UIBezierPath()
    shadow9.move(to: CGPoint(x: 299, y: 162))
    shadow9.addLine(to: CGPoint(x: 298, y: 177))
    shadow9.addLine(to: CGPoint(x: 310, y: 197))
    shadow9.addQuadCurve(to: CGPoint(x: 299, y: 162), controlPoint: CGPoint(x: 303, y:165))
    addShadowLayer(shadow: shadow9, opacity: shadowOpacity, uiView: uiView)
    
    let shadow10 = UIBezierPath()
    shadow10.move(to: CGPoint(x: 273, y: 104))
    shadow10.addQuadCurve(to: CGPoint(x: 277, y: 138), controlPoint: CGPoint(x: 278, y:128))
    shadow10.addQuadCurve(to: CGPoint(x: 282, y: 170), controlPoint: CGPoint(x: 282, y:152))
    shadow10.addQuadCurve(to: CGPoint(x: 273, y: 104), controlPoint: CGPoint(x: 289, y:137))
    addShadowLayer(shadow: shadow10, opacity: shadowOpacity, uiView: uiView)
    
    let shadow11 = UIBezierPath()
    shadow11.move(to: CGPoint(x: 249, y: 137))
    shadow11.addLine(to: CGPoint(x: 257, y: 170))
    shadow11.addQuadCurve(to: CGPoint(x: 255, y: 139), controlPoint: CGPoint(x: 257, y:150))
    shadow11.close()
    addShadowLayer(shadow: shadow11, opacity: shadowOpacity, uiView: uiView)
    
    let shadow12 = UIBezierPath()
    shadow12.move(to: CGPoint(x: 223, y: 124))
    shadow12.addQuadCurve(to: CGPoint(x: 213, y: 128), controlPoint: CGPoint(x: 212, y:125))
    shadow12.addLine(to: CGPoint(x: 215, y: 150))
    shadow12.addQuadCurve(to: CGPoint(x: 206, y: 180), controlPoint: CGPoint(x: 207, y:158))
    shadow12.addQuadCurve(to: CGPoint(x: 208, y: 126), controlPoint: CGPoint(x: 197, y:155))
    shadow12.addLine(to: CGPoint(x: 202, y: 126))
    shadow12.addLine(to: CGPoint(x: 209, y: 122))
    shadow12.addQuadCurve(to: CGPoint(x: 219, y: 119), controlPoint: CGPoint(x: 213, y:122))
    addShadowLayer(shadow: shadow12, opacity: shadowOpacity, uiView: uiView)
    
    let shadow13 = UIBezierPath()
    shadow13.move(to: CGPoint(x: 167, y: 120))
    shadow13.addQuadCurve(to: CGPoint(x: 161, y: 182), controlPoint: CGPoint(x: 159, y:151))
    shadow13.addCurve(to: CGPoint(x: 167, y: 120), controlPoint1: CGPoint(x: 152, y:170),controlPoint2: CGPoint(x: 156, y:127))
    addShadowLayer(shadow: shadow13, opacity: shadowOpacity, uiView: uiView)
    
    let shadow14 = UIBezierPath()
    shadow14.move(to: CGPoint(x: 129, y: 160))
    shadow14.addQuadCurve(to: CGPoint(x: 120, y: 185), controlPoint: CGPoint(x: 125, y:170))
    shadow14.addQuadCurve(to: CGPoint(x: 131, y: 166), controlPoint: CGPoint(x: 125, y:180))
    addShadowLayer(shadow: shadow14, opacity: shadowOpacity, uiView: uiView)
    
    let shadow15 = UIBezierPath()
    shadow15.move(to: CGPoint(x: 113, y: 148))
    shadow15.addQuadCurve(to: CGPoint(x: 109, y: 233), controlPoint: CGPoint(x: 100, y:197))
    shadow15.addLine(to: CGPoint(x: 112, y: 208))
    addShadowLayer(shadow: shadow15, opacity: shadowOpacity, uiView: uiView)
}

func drawUniform(uiView: UIView, imgOpacity: CGFloat){
    // uniform: black
    // right
    let uniformRightLine = UIBezierPath()
    uniformRightLine.move(to: CGPoint(x: 58, y: 476))
    uniformRightLine.addQuadCurve(to: CGPoint(x: 56, y: 443), controlPoint: CGPoint(x: 56, y: 458))
    uniformRightLine.addLine(to: CGPoint(x: 56, y: 367))
    uniformRightLine.addLine(to: CGPoint(x: 83, y: 367))
    uniformRightLine.addLine(to: CGPoint(x: 83, y: 369))
    uniformRightLine.addQuadCurve(to: CGPoint(x: 99, y: 476), controlPoint: CGPoint(x: 83, y: 425))
    uniformRightLine.close()
    let uniformRightLayer = CAShapeLayer()
    uniformRightLayer.path = uniformRightLine.cgPath
    uniformRightLayer.strokeColor = CGColor(srgbRed: 57/255, green: 35/255, blue: 50/255, alpha: 1)
    uniformRightLayer.fillColor = UIColor(red: 57/255, green: 35/255, blue: 50/255, alpha: imgOpacity).cgColor
    uniformRightLayer.lineWidth = 1
    uiView.layer.addSublayer(uniformRightLayer)
    // left
    let uniformLeftLine = UIBezierPath()
    uniformLeftLine.move(to: CGPoint(x: 371, y: 476))
    uniformLeftLine.addLine(to: CGPoint(x: 380, y: 374))
    uniformLeftLine.addLine(to: CGPoint(x: 355, y: 374))
    uniformLeftLine.addQuadCurve(to: CGPoint(x: 330, y: 476), controlPoint: CGPoint(x: 359, y: 385))
    uniformLeftLine.close()
    let uniformLeftLayer = CAShapeLayer()
    uniformLeftLayer.path = uniformLeftLine.cgPath
    uniformLeftLayer.strokeColor = CGColor(srgbRed: 57/255, green: 35/255, blue: 50/255, alpha: 1)
    uniformLeftLayer.fillColor = UIColor(red: 57/255, green: 35/255, blue: 50/255, alpha: imgOpacity).cgColor
    uniformLeftLayer.lineWidth = 1
    uiView.layer.addSublayer(uniformLeftLayer)
}

func drawSkin(uiView: UIView, lineColor: CGColor, skinColor: CGColor){
    // skin
    let skinLine = UIBezierPath()
    skinLine.move(to: CGPoint(x: 207, y: 476))
    skinLine.addQuadCurve(to: CGPoint(x: 173, y: 363), controlPoint: CGPoint(x: 178, y: 410))
    skinLine.addQuadCurve(to: CGPoint(x: 179, y: 361), controlPoint: CGPoint(x: 177, y: 361))
    skinLine.addCurve(to: CGPoint(x: 174, y: 337), controlPoint1: CGPoint(x: 180, y:346),controlPoint2: CGPoint(x: 179, y:339))
    skinLine.addLine(to: CGPoint(x: 105, y: 300))
    skinLine.addLine(to: CGPoint(x: 105, y: 175))
    skinLine.addLine(to: CGPoint(x: 317, y: 175))
    skinLine.addLine(to: CGPoint(x: 317, y: 336))
    skinLine.addLine(to: CGPoint(x: 255, y: 336))
    skinLine.addLine(to: CGPoint(x: 253, y: 358))
    skinLine.addLine(to: CGPoint(x: 257, y: 362))
    skinLine.addQuadCurve(to: CGPoint(x: 225, y: 476), controlPoint: CGPoint(x: 247, y: 418))
    
    let skinLayer = CAShapeLayer()
    skinLayer.path = skinLine.cgPath
    skinLayer.strokeColor = lineColor
    skinLayer.fillColor = skinColor
    skinLayer.lineWidth = 1
    uiView.layer.addSublayer(skinLayer)
}

func drawHair(uiView: UIView, hairTopColor: CGColor, lineColor: CGColor, mainColor: CGColor){
    // hair
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 214, y: 6))
    path.addQuadCurve(to: CGPoint(x: 201, y: 5), controlPoint: CGPoint(x: 207, y: 5))
    path.addQuadCurve(to: CGPoint(x: 117, y: 36), controlPoint: CGPoint(x: 155, y: 5))
    path.addQuadCurve(to: CGPoint(x: 65, y: 130), controlPoint: CGPoint(x: 80, y:63))
    path.addQuadCurve(to: CGPoint(x: 52, y: 232), controlPoint: CGPoint(x: 54, y:208))
    path.addCurve(to: CGPoint(x: 0, y: 295), controlPoint1: CGPoint(x: 51, y:240),controlPoint2: CGPoint(x: 36, y:254))
    path.addLine(to: CGPoint(x: 0, y: 317))
    path.addCurve(to: CGPoint(x: 49, y: 253), controlPoint1: CGPoint(x: 13, y:288),controlPoint2: CGPoint(x: 42, y:269))
    path.addCurve(to: CGPoint(x: 0, y: 345), controlPoint1: CGPoint(x: 47, y:281),controlPoint2: CGPoint(x: 12, y:295))
    path.addLine(to: CGPoint(x: 0, y: 365))
    path.addQuadCurve(to: CGPoint(x: 17, y: 400), controlPoint: CGPoint(x: 7, y:396))
    path.addCurve(to: CGPoint(x: 10, y: 359), controlPoint1: CGPoint(x: 19, y:393),controlPoint2: CGPoint(x: 9, y:369))
    path.addCurve(to: CGPoint(x: 10, y: 413), controlPoint1: CGPoint(x: 12, y:385),controlPoint2: CGPoint(x: 25, y:400))
    path.addQuadCurve(to: CGPoint(x: 26, y: 403), controlPoint: CGPoint(x: 21, y:411))
    path.addQuadCurve(to: CGPoint(x: 24, y: 396), controlPoint: CGPoint(x: 26, y:402))
    path.addQuadCurve(to: CGPoint(x: 56, y: 443), controlPoint: CGPoint(x: 29, y:420))
    path.addQuadCurve(to: CGPoint(x: 58, y: 414), controlPoint: CGPoint(x: 57, y:436))
    path.addCurve(to: CGPoint(x: 72, y: 263), controlPoint1: CGPoint(x: 23, y:361),controlPoint2: CGPoint(x: 72, y:276))
    path.addCurve(to: CGPoint(x: 58, y: 414), controlPoint1: CGPoint(x: 66, y:289),controlPoint2: CGPoint(x: 25, y:367))
    path.addQuadCurve(to: CGPoint(x: 83, y: 369), controlPoint: CGPoint(x: 58, y:363))
    path.addLine(to: CGPoint(x: 115, y: 362))
    
    path.addQuadCurve(to: CGPoint(x: 117, y: 350), controlPoint: CGPoint(x: 118, y:353))
    path.addQuadCurve(to: CGPoint(x: 100, y: 306), controlPoint: CGPoint(x: 113, y:328))
    path.addQuadCurve(to: CGPoint(x: 101, y: 365), controlPoint: CGPoint(x: 97, y:340))
    path.addQuadCurve(to: CGPoint(x: 100, y: 306), controlPoint: CGPoint(x: 97, y:340))
    path.addQuadCurve(to: CGPoint(x: 80, y: 123), controlPoint: CGPoint(x: 54, y:205))
    path.addQuadCurve(to: CGPoint(x: 100, y: 306), controlPoint: CGPoint(x: 54, y:205))
    path.addQuadCurve(to: CGPoint(x: 117, y: 350), controlPoint: CGPoint(x: 113, y:328))
    path.addQuadCurve(to: CGPoint(x: 118, y: 337), controlPoint: CGPoint(x: 118, y:344))
    path.addCurve(to: CGPoint(x: 121, y: 465), controlPoint1: CGPoint(x: 120, y:390),controlPoint2: CGPoint(x: 60, y:426))
    path.addQuadCurve(to: CGPoint(x: 115, y: 438), controlPoint: CGPoint(x: 115, y:451))
    path.addQuadCurve(to: CGPoint(x: 129, y: 458), controlPoint: CGPoint(x: 119, y:448))
    path.addQuadCurve(to: CGPoint(x: 121, y: 401), controlPoint: CGPoint(x: 113, y:425))
    
    path.addCurve(to: CGPoint(x: 138, y: 384), controlPoint1: CGPoint(x: 132, y:403),controlPoint2: CGPoint(x: 135, y:390))
    path.addQuadCurve(to: CGPoint(x: 124, y: 391), controlPoint: CGPoint(x: 132, y:389))
    path.addQuadCurve(to: CGPoint(x: 134, y: 358), controlPoint: CGPoint(x: 132, y:372))
    path.addLine(to: CGPoint(x: 138, y: 357))
    path.addCurve(to: CGPoint(x: 129, y: 400), controlPoint1: CGPoint(x: 142, y:367),controlPoint2: CGPoint(x: 140, y:389))
    path.addQuadCurve(to: CGPoint(x: 151, y: 357), controlPoint: CGPoint(x: 152, y:388))
    path.addQuadCurve(to: CGPoint(x: 174, y: 337), controlPoint: CGPoint(x: 165, y:335))
    path.addLine(to: CGPoint(x: 139, y: 316))
    path.addQuadCurve(to: CGPoint(x: 109, y: 235), controlPoint: CGPoint(x: 120, y:275))
    path.addQuadCurve(to: CGPoint(x: 120, y: 184), controlPoint: CGPoint(x: 114, y:201))
    // maegami
    path.addQuadCurve(to: CGPoint(x: 133, y: 180), controlPoint: CGPoint(x: 128, y:180))
    path.addQuadCurve(to: CGPoint(x: 161, y: 182), controlPoint: CGPoint(x: 147, y:178))
    path.addQuadCurve(to: CGPoint(x: 217, y: 180), controlPoint: CGPoint(x: 190, y:185))
    path.addLine(to: CGPoint(x: 257, y: 179))
    path.addCurve(to: CGPoint(x: 310, y: 197), controlPoint1: CGPoint(x: 264, y:183),controlPoint2: CGPoint(x: 301, y:175))
    path.addQuadCurve(to: CGPoint(x: 314, y: 238), controlPoint: CGPoint(x: 315, y:211))
    // left hair
    path.addCurve(to: CGPoint(x: 283, y: 315), controlPoint1: CGPoint(x: 314, y:247),controlPoint2: CGPoint(x: 291, y:278))
    path.addLine(to: CGPoint(x: 254, y: 336))
    path.addQuadCurve(to: CGPoint(x: 272, y: 355), controlPoint: CGPoint(x: 270, y:338))
    path.addLine(to: CGPoint(x: 281, y: 357))
    path.addCurve(to: CGPoint(x: 324, y: 391), controlPoint1: CGPoint(x: 288, y:393),controlPoint2: CGPoint(x: 314, y:400))
    path.addCurve(to: CGPoint(x: 291, y: 359), controlPoint1: CGPoint(x: 286, y:390),controlPoint2: CGPoint(x: 292, y:374))
    path.addLine(to: CGPoint(x: 305, y: 363))
    path.addQuadCurve(to: CGPoint(x: 316, y: 390), controlPoint: CGPoint(x: 315, y:384))
    path.addQuadCurve(to: CGPoint(x: 324, y: 391), controlPoint: CGPoint(x: 319, y:390))
    path.addQuadCurve(to: CGPoint(x: 318, y: 394), controlPoint: CGPoint(x: 322, y:393))
    path.addQuadCurve(to: CGPoint(x: 307, y: 441), controlPoint: CGPoint(x: 320, y:419))
    path.addQuadCurve(to: CGPoint(x: 324, y: 417), controlPoint: CGPoint(x: 319, y:432))
    path.addQuadCurve(to: CGPoint(x: 302, y: 458), controlPoint: CGPoint(x: 324, y:443))
    path.addCurve(to: CGPoint(x: 327, y: 367), controlPoint1: CGPoint(x: 340, y:458),controlPoint2: CGPoint(x: 350, y:415))
    path.addLine(to: CGPoint(x: 355, y: 374))
    path.addCurve(to: CGPoint(x: 372, y: 380), controlPoint1: CGPoint(x: 357, y:375),controlPoint2: CGPoint(x: 370, y:375))
    path.addQuadCurve(to: CGPoint(x: 372, y: 463), controlPoint: CGPoint(x: 377, y:411))
    path.addQuadCurve(to: CGPoint(x: 382, y: 452), controlPoint: CGPoint(x: 380, y:456))
    path.addQuadCurve(to: CGPoint(x: 405, y: 417), controlPoint: CGPoint(x: 403, y:437))
    path.addQuadCurve(to: CGPoint(x: 414, y: 428), controlPoint: CGPoint(x: 408, y:423))
    path.addLine(to: CGPoint(x: 414, y: 339))
    path.addCurve(to: CGPoint(x: 376, y: 262), controlPoint1: CGPoint(x: 411, y:335),controlPoint2: CGPoint(x: 381, y:287))
    path.addQuadCurve(to: CGPoint(x: 414, y: 304), controlPoint: CGPoint(x: 387, y:279))
    path.addLine(to: CGPoint(x: 414, y: 289))
    path.addQuadCurve(to: CGPoint(x: 366, y: 212), controlPoint: CGPoint(x: 387, y:266))
    path.addQuadCurve(to: CGPoint(x: 243, y: 6), controlPoint: CGPoint(x: 366, y: 17))
    path.addQuadCurve(to: CGPoint(x: 214, y: 6), controlPoint: CGPoint(x: 225, y: 4))
    let hairLayer = CAShapeLayer()
    hairLayer.path = path.cgPath
    let hairGradientLayer = CAGradientLayer()
    hairGradientLayer.colors = [hairTopColor, mainColor]
    hairGradientLayer.borderColor = UIColor.black.cgColor
    hairGradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 476)
    uiView.layer.addSublayer(hairGradientLayer)
    hairGradientLayer.mask = hairLayer

    let hairOutlineLayer = CAShapeLayer()
    hairOutlineLayer.path = path.cgPath
    hairOutlineLayer.strokeColor = lineColor
    hairOutlineLayer.fillColor = UIColor.clear.cgColor
    hairOutlineLayer.lineWidth = 1
    uiView.layer.addSublayer(hairOutlineLayer)
}

func drawRibbon(uiView: UIView, lineColor: CGColor, imgOpacity: CGFloat){
    let ribbon = UIBezierPath()
    //16881172138
    ribbon.move(to: CGPoint(x: 167,y: 79))
    ribbon.addQuadCurve(to: CGPoint(x: 170, y: 135), controlPoint: CGPoint(x: 163, y:110))
    ribbon.addQuadCurve(to: CGPoint(x: 175, y: 136), controlPoint: CGPoint(x: 171, y:137))
    ribbon.addQuadCurve(to: CGPoint(x: 209, y: 121), controlPoint: CGPoint(x: 190, y:132))
    ribbon.addQuadCurve(to: CGPoint(x: 219, y: 119), controlPoint: CGPoint(x: 213, y:122))
    ribbon.addQuadCurve(to: CGPoint(x: 250, y: 137), controlPoint: CGPoint(x: 228, y:132))
    ribbon.addQuadCurve(to: CGPoint(x: 255, y: 135), controlPoint: CGPoint(x: 256, y:139))
    ribbon.addQuadCurve(to: CGPoint(x: 258, y: 112), controlPoint: CGPoint(x: 257, y:120))
    ribbon.addQuadCurve(to: CGPoint(x: 261, y: 80), controlPoint: CGPoint(x: 263, y:90))
    ribbon.addQuadCurve(to: CGPoint(x: 220, y: 98), controlPoint: CGPoint(x: 245, y:78))
    ribbon.addQuadCurve(to: CGPoint(x: 210, y: 96), controlPoint: CGPoint(x: 217, y:93))
    ribbon.addCurve(to: CGPoint(x: 167, y: 79), controlPoint1: CGPoint(x: 197, y:80),controlPoint2: CGPoint(x: 170, y:73))
    let ribbonLayer = CAShapeLayer()
    ribbonLayer.path = ribbon.cgPath
    ribbonLayer.strokeColor = lineColor
    ribbonLayer.fillColor = UIColor(red: 72/255, green: 36/255, blue: 43/255, alpha: imgOpacity).cgColor
    ribbonLayer.lineWidth = 1
    uiView.layer.addSublayer(ribbonLayer)
}

func drawMouth(uiView: UIView, lineColor: CGColor, skinColor: CGColor, imgOpacity: CGFloat){
    let mouth = UIBezierPath()
    mouth.move(to: CGPoint(x: 208, y: 323))
    mouth.addQuadCurve(to: CGPoint(x: 190, y: 304), controlPoint: CGPoint(x: 190, y:320))
    mouth.addQuadCurve(to: CGPoint(x: 193, y: 296), controlPoint: CGPoint(x: 189, y:297))
    mouth.addQuadCurve(to: CGPoint(x: 237, y: 296), controlPoint: CGPoint(x: 213, y:295))
    mouth.addQuadCurve(to: CGPoint(x: 240, y: 302), controlPoint: CGPoint(x: 241, y:297))
    mouth.addQuadCurve(to: CGPoint(x: 224, y: 323), controlPoint: CGPoint(x: 240, y:319))
    mouth.close()
    let mouthLayer = CAShapeLayer()
    mouthLayer.path = mouth.cgPath
    mouthLayer.strokeColor = lineColor
    mouthLayer.fillColor = UIColor(red: 244/255, green: 184/255, blue: 156/255, alpha: imgOpacity).cgColor
    mouthLayer.lineWidth = 1
    uiView.layer.addSublayer(mouthLayer)
    
    // clear bottom mouth
    let vanishMouthLine = UIBezierPath()
    vanishMouthLine.move(to: CGPoint(x: 208, y: 323))
    vanishMouthLine.addLine(to: CGPoint(x: 224, y: 323))
    let vanishMouthLayer = CAShapeLayer()
    vanishMouthLayer.path = vanishMouthLine.cgPath
    vanishMouthLayer.strokeColor = skinColor
    vanishMouthLayer.fillColor = UIColor.clear.cgColor
    vanishMouthLayer.lineWidth = 1
    uiView.layer.addSublayer(vanishMouthLayer)
}

func drawPinkMaegami(uiView: UIView, hairTopColor: CGColor){
    let vanishHairLine = UIBezierPath()
    vanishHairLine.move(to: CGPoint(x: 121, y: 183))
    vanishHairLine.addQuadCurve(to: CGPoint(x: 133, y: 180), controlPoint: CGPoint(x: 128, y:180))
    vanishHairLine.addQuadCurve(to: CGPoint(x: 161, y: 182), controlPoint: CGPoint(x: 147, y:178))
    vanishHairLine.addQuadCurve(to: CGPoint(x: 217, y: 179), controlPoint: CGPoint(x: 190, y:185))
    vanishHairLine.addLine(to: CGPoint(x: 257, y: 179))
    vanishHairLine.addCurve(to: CGPoint(x: 309, y: 197), controlPoint1: CGPoint(x: 264, y:183),controlPoint2: CGPoint(x: 301, y:175))
    
    let vanishHairLayer = CAShapeLayer()
    vanishHairLayer.path = vanishHairLine.cgPath
    vanishHairLayer.strokeColor = hairTopColor
    vanishHairLayer.fillColor = UIColor.clear.cgColor
    vanishHairLayer.lineWidth = 3
    uiView.layer.addSublayer(vanishHairLayer)
}

func drawBlackLine(uiView: UIView, lineColor: CGColor){
    let hairLineExtra = UIBezierPath()
    hairLineExtra.move(to: CGPoint(x: 151, y: 357))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 139, y: 316), controlPoint: CGPoint(x: 145, y:328))
    hairLineExtra.move(to: CGPoint(x: 121, y: 401))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 104, y: 391), controlPoint: CGPoint(x: 110, y:399))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 124, y: 391), controlPoint: CGPoint(x: 117, y:394))
    hairLineExtra.move(to: CGPoint(x: 134, y: 358))
    hairLineExtra.addLine(to: CGPoint(x: 135, y: 349))
    hairLineExtra.move(to: CGPoint(x: 138, y: 357))
    hairLineExtra.addCurve(to: CGPoint(x: 94, y: 256), controlPoint1: CGPoint(x: 132, y:330),controlPoint2: CGPoint(x: 110, y:324))
    hairLineExtra.move(to: CGPoint(x: 109, y: 235))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 116, y: 136), controlPoint: CGPoint(x:100, y:179))
    hairLineExtra.move(to: CGPoint(x: 120, y: 184))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 130, y: 159), controlPoint: CGPoint(x:126, y:163))
    hairLineExtra.move(to: CGPoint(x: 133, y: 180))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 145, y: 86), controlPoint: CGPoint(x:122, y:128))
    hairLineExtra.move(to: CGPoint(x: 143, y: 179))
    hairLineExtra.addLine(to: CGPoint(x: 142, y: 155))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 147, y: 180), controlPoint: CGPoint(x:145, y:175))
    hairLineExtra.move(to: CGPoint(x: 136, y: 164))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 167, y: 153), controlPoint: CGPoint(x:150, y:155))
    hairLineExtra.move(to: CGPoint(x: 151, y: 180))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 151, y: 107), controlPoint: CGPoint(x:143, y:144))
    hairLineExtra.move(to: CGPoint(x: 161, y: 182))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 167, y: 121), controlPoint: CGPoint(x:157, y:151))
    hairLineExtra.move(to: CGPoint(x: 218, y: 53))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 214, y: 85), controlPoint: CGPoint(x:215, y:69))
    hairLineExtra.move(to: CGPoint(x: 178, y: 138))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 175, y: 183), controlPoint: CGPoint(x:173, y:163))
    hairLineExtra.move(to: CGPoint(x: 182, y: 183))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 190, y: 136), controlPoint: CGPoint(x:183, y:165))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 190, y: 183), controlPoint: CGPoint(x:187, y:145))
    hairLineExtra.move(to: CGPoint(x: 205, y: 181))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 212, y: 127), controlPoint: CGPoint(x:205, y:154))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 216, y: 180), controlPoint: CGPoint(x:215, y:154))
    hairLineExtra.move(to: CGPoint(x: 235, y: 179))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 235, y: 136), controlPoint: CGPoint(x:237, y:154))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 239, y: 179), controlPoint: CGPoint(x:238, y:154))
    hairLineExtra.move(to: CGPoint(x: 255, y: 150))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 292, y: 165), controlPoint: CGPoint(x:275, y:154))
    hairLineExtra.move(to: CGPoint(x: 257, y: 179))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 254, y: 137), controlPoint: CGPoint(x:257, y:149))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 263, y: 180), controlPoint: CGPoint(x:260, y:160))
    hairLineExtra.move(to: CGPoint(x: 277, y: 177))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 272, y: 100), controlPoint: CGPoint(x:279, y:136))
    hairLineExtra.move(to: CGPoint(x: 277, y: 141))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 281, y: 181), controlPoint: CGPoint(x:282, y:150))
    hairLineExtra.move(to: CGPoint(x: 286, y: 81))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 297, y: 181), controlPoint: CGPoint(x:304, y:115))
    hairLineExtra.move(to: CGPoint(x: 299, y: 160))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 310, y: 197), controlPoint: CGPoint(x:307, y:180))
    hairLineExtra.move(to: CGPoint(x: 314, y: 240))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 317, y: 164), controlPoint: CGPoint(x: 323, y:211))
    hairLineExtra.move(to: CGPoint(x: 272, y: 355))
    hairLineExtra.addLine(to: CGPoint(x: 273, y: 364))
    hairLineExtra.move(to: CGPoint(x: 283, y: 315))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 281, y: 357), controlPoint: CGPoint(x: 278, y:344))
    hairLineExtra.move(to: CGPoint(x: 291, y: 359))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 296, y: 327), controlPoint: CGPoint(x: 291, y:344))
    hairLineExtra.addCurve(to: CGPoint(x: 335, y: 231), controlPoint1: CGPoint(x: 299, y:315),controlPoint2: CGPoint(x: 324, y:281))
    hairLineExtra.move(to: CGPoint(x: 297, y: 325))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 305, y: 363), controlPoint: CGPoint(x: 296, y:340))
    hairLineExtra.move(to: CGPoint(x: 324, y: 417))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 327, y: 401), controlPoint: CGPoint(x: 326, y:410))
    hairLineExtra.move(to: CGPoint(x: 357, y: 149))
    hairLineExtra.addCurve(to: CGPoint(x: 315, y: 359), controlPoint1: CGPoint(x: 373, y:258),controlPoint2: CGPoint(x: 308, y:303))
    hairLineExtra.move(to: CGPoint(x: 382, y: 452))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 390, y: 427), controlPoint: CGPoint(x: 388, y:442))
    hairLineExtra.move(to: CGPoint(x: 405, y: 417))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 400, y: 398), controlPoint: CGPoint(x: 401, y:410))
    hairLineExtra.move(to: CGPoint(x: 327, y: 367))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 317, y: 330), controlPoint: CGPoint(x: 322, y:357))
    hairLineExtra.move(to: CGPoint(x: 365, y: 342))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 373, y: 373), controlPoint: CGPoint(x: 372, y:360))
    hairLineExtra.move(to: CGPoint(x: 342, y: 269))
    hairLineExtra.addCurve(to: CGPoint(x: 385, y: 386), controlPoint1: CGPoint(x: 345, y:305),controlPoint2: CGPoint(x: 382, y:340))
    hairLineExtra.move(to: CGPoint(x: 411, y: 357))
    hairLineExtra.addLine(to: CGPoint(x: 414, y: 363))
    hairLineExtra.move(to: CGPoint(x: 376, y: 262))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 372, y: 244), controlPoint: CGPoint(x: 375, y:259))
    // neck
    hairLineExtra.move(to: CGPoint(x: 173, y: 363))
    hairLineExtra.addLine(to: CGPoint(x: 172, y: 354))
    hairLineExtra.move(to: CGPoint(x: 179, y: 361))
    hairLineExtra.addLine(to: CGPoint(x: 178, y: 366))
    hairLineExtra.move(to: CGPoint(x: 253, y: 358))
    hairLineExtra.addLine(to: CGPoint(x: 252, y: 373))
    hairLineExtra.move(to: CGPoint(x: 257, y: 362))
    hairLineExtra.addLine(to: CGPoint(x: 258, y: 352))
    hairLineExtra.move(to: CGPoint(x: 183, y: 411))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 206, y: 423), controlPoint: CGPoint(x: 196, y:416))
    hairLineExtra.move(to: CGPoint(x: 246, y: 413))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 227, y: 425), controlPoint: CGPoint(x: 237, y:416))
    hairLineExtra.move(to: CGPoint(x: 174, y: 337))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 214, y: 356), controlPoint: CGPoint(x: 215, y:359))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 227, y: 352), controlPoint: CGPoint(x: 220, y:357))
    hairLineExtra.addLine(to: CGPoint(x: 256, y: 335))
    // eye
    // right
    hairLineExtra.move(to: CGPoint(x: 138, y: 196))
    hairLineExtra.addLine(to: CGPoint(x: 139, y: 202))
    hairLineExtra.move(to: CGPoint(x: 157, y: 189))
    hairLineExtra.addLine(to: CGPoint(x: 155, y: 196))
    hairLineExtra.move(to: CGPoint(x: 143, y: 192))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 176, y: 190), controlPoint: CGPoint(x: 160, y:185))
    hairLineExtra.move(to: CGPoint(x: 143, y: 192))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 176, y: 190), controlPoint: CGPoint(x: 160, y:185))
    hairLineExtra.move(to: CGPoint(x: 134, y: 247))
    hairLineExtra.addLine(to: CGPoint(x: 135, y: 245))
    hairLineExtra.move(to: CGPoint(x: 138, y: 247))
    hairLineExtra.addLine(to: CGPoint(x: 137, y: 249))
    // left
    hairLineExtra.move(to: CGPoint(x: 293, y: 198))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 247, y: 192), controlPoint: CGPoint(x: 273, y:182))
    hairLineExtra.move(to: CGPoint(x: 262, y: 189))
    hairLineExtra.addLine(to: CGPoint(x: 261, y: 195))
    hairLineExtra.move(to: CGPoint(x: 284, y: 196))
    hairLineExtra.addLine(to: CGPoint(x: 282, y: 201))
    hairLineExtra.move(to: CGPoint(x: 294, y: 241))
    hairLineExtra.addLine(to: CGPoint(x: 295, y: 242))
    hairLineExtra.move(to: CGPoint(x: 292, y: 243))
    hairLineExtra.addLine(to: CGPoint(x: 293, y: 244))
    // ribbon
    hairLineExtra.move(to: CGPoint(x: 209,y: 121))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 210, y: 96), controlPoint: CGPoint(x: 204, y:110))
    hairLineExtra.move(to: CGPoint(x: 219,y: 119))
    hairLineExtra.addQuadCurve(to: CGPoint(x: 220, y: 98), controlPoint: CGPoint(x: 221, y:110))
    
    let hairLineExtraLayer = CAShapeLayer()
    hairLineExtraLayer.path = hairLineExtra.cgPath
    hairLineExtraLayer.strokeColor = lineColor
    hairLineExtraLayer.fillColor = UIColor.clear.cgColor
    hairLineExtraLayer.lineWidth = 1
    uiView.layer.addSublayer(hairLineExtraLayer)
}

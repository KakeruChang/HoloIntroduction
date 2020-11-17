//
//  SwiftUIView.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/16.
//

import SwiftUI

struct DrawView: UIViewRepresentable {
    var imgName:String
    // @Binding  var areaColor:CGColor
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var device: String
    var imgOpacity: CGFloat = 1
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let mainColor =  CGColor(srgbRed: red, green: green, blue: blue, alpha: imgOpacity)
        uiView.layer.sublayers?.first?.removeFromSuperlayer()
        
        // remove old layer
        uiView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        if(imgName == "mentori"){
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
            bodyLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
            bodyLayer.fillColor = mainColor
            bodyLayer.lineWidth = 2
            uiView.layer.addSublayer(bodyLayer)
            
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
            leftWingLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
            leftWingLayer.lineWidth = 2
            leftWingLayer.fillColor = mainColor
            uiView.layer.addSublayer(leftWingLayer)
        }
        if(imgName == "chika"){
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
            path.addQuadCurve(to: CGPoint(x: 83, y: 369), controlPoint: CGPoint(x: 60, y:360))
            path.addLine(to: CGPoint(x: 115, y: 362))
            path.addLine(to: CGPoint(x: 101, y: 365))
            path.addLine(to: CGPoint(x: 99, y: 304))
            path.addQuadCurve(to: CGPoint(x: 80, y: 123), controlPoint: CGPoint(x: 57, y:205))
            path.addCurve(to: CGPoint(x: 117, y: 351), controlPoint1: CGPoint(x: 48, y:219),controlPoint2: CGPoint(x: 114, y:329))
            path.addQuadCurve(to: CGPoint(x: 118, y: 337), controlPoint: CGPoint(x: 118, y:344))
            path.addCurve(to: CGPoint(x: 121, y: 465), controlPoint1: CGPoint(x: 120, y:390),controlPoint2: CGPoint(x: 60, y:426))
            path.addQuadCurve(to: CGPoint(x: 115, y: 438), controlPoint: CGPoint(x: 115, y:451))
            path.close()
            
            let triangleLayer = CAShapeLayer()
            triangleLayer.path = path.cgPath
            
            triangleLayer.strokeColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
            triangleLayer.fillColor = mainColor
            triangleLayer.lineWidth = 0.5
            
            
            uiView.layer.addSublayer(triangleLayer)
        }
    }
    
}

struct SwiftUIView: View {
    @State var red: CGFloat = 150/255
    @State var green: CGFloat  = 151/255
    @State var blue: CGFloat  = 199/255
    @State var imgName = "mentori" // "chika"
    @State var device = "cellphone"
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Slider(value: $red, in: 0...1).accentColor(.red)
                    Slider(value: $green, in: 0...1).accentColor(.green)
                    Slider(value: $blue, in: 0...1).accentColor(.blue)
                }.padding()
                VStack {
                    HStack {
                        Button(action: {
                            self.device = "cellphone"
                        }) {
                            let type = device == "cellphone" ? "phone.fill" : "phone"
                            Image(systemName: type)
                        }
                    }.padding()
                    HStack {
                        Button(action: {
                            self.device = "book"
                        }) {
                            let type = device == "book" ? "book.fill" : "book"
                            Image(systemName: type).foregroundColor(.green)
                        }
                    }.padding()
                }.padding(1.0)
                VStack {
                    HStack {
                        Button(action: {
                            self.device = "star"
                        }) {
                            let type = device == "star" ? "star.fill" : "star"
                            Image(systemName: type).foregroundColor(.yellow)
                        }
                    }.padding()
                    HStack {
                        Button(action: {
                            self.device = "ruler"
                        }) {
                            let type = device == "ruler" ? "ruler.fill" : "ruler"
                            Image(systemName: type).foregroundColor(.orange)
                        }
                    }.padding()
                }.padding(1.0)
                
            }
            

            ZStack(alignment: .top){
                Image(imgName)
                    .resizable()
                    .scaledToFit()
                    .opacity(0)
                DrawView(imgName: self.imgName, red: self.red, green: self.green, blue: self.blue,device: self.device)
            }
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

//
//  SwiftUIView.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/16.
//

import SwiftUI

struct UBColor {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
}

struct DrawView: UIViewRepresentable {
    var mainColorWithoutOpacity: UBColor
    var shadowOpacity:CGFloat
    var eyeColor: UBColor
    var imgName:String
    // @Binding  var areaColor:CGColor
    var device: String
    var imgOpacity: CGFloat
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let mainColor =  CGColor(srgbRed: mainColorWithoutOpacity.red, green: mainColorWithoutOpacity.green, blue: mainColorWithoutOpacity.blue, alpha: imgOpacity)
        uiView.layer.sublayers?.first?.removeFromSuperlayer()
        
        // remove old layer
        uiView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        if imgName == "mentori" {
            DrawMentori(uiView: uiView, red: mainColorWithoutOpacity.red, green: mainColorWithoutOpacity.green, blue: mainColorWithoutOpacity.blue, device: device, imgOpacity: imgOpacity)
        }
        if imgName == "chika" {
            let lineColor = CGColor(srgbRed: 58/255, green: 24/255, blue: 30/255, alpha: 1)
            let hairTopColor = CGColor(red: 241/255, green: 222/255, blue: 233/255, alpha: imgOpacity)
            let skinColor = UIColor(red: 248/255, green: 239/255, blue: 224/255, alpha: imgOpacity).cgColor
            
            drawUniform(uiView: uiView, imgOpacity: imgOpacity)
            
            drawSkin(uiView: uiView, lineColor: lineColor, skinColor: skinColor)
            
            drawHair(uiView: uiView, hairTopColor: hairTopColor, lineColor: lineColor, mainColor: mainColor)
            
            drawRibbon(uiView: uiView, lineColor: lineColor, imgOpacity: imgOpacity)
            
            // nose
            drawLine(startX: 213, startY: 268, endX: 213, endY: 272, color: lineColor, width: 1, uiView: uiView)
            
            drawMouth(uiView: uiView, lineColor: lineColor, skinColor: skinColor, imgOpacity: imgOpacity)
            
            drawChikaRightEye(uiView: uiView, imgOpacity: imgOpacity, lineColor: lineColor, eyeColor: eyeColor)
            
            drawChikaLeftEye(uiView: uiView, imgOpacity: imgOpacity, lineColor: lineColor, eyeColor: eyeColor)
            
            // cover black maegami
            drawPinkMaegami(uiView: uiView, hairTopColor: hairTopColor)
            
            drawAllLuster(uiView: uiView)
            
            drawFlush(uiView: uiView)
            
            drawShadow(uiView: uiView, shadowOpacity: shadowOpacity)
            
            drawBlackLine(uiView: uiView, lineColor: lineColor)
            
        }
    }
    
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct SwiftUIView: View {
    @State var mainColor = UBColor(red: 234/255, green: 206/255, blue: 224/255)
    @State var eyeColor = UBColor(red: 194/255, green: 232/255, blue: 239/255)
    @State var imgName = "chika"
    @State var device = "cellphone"
    @State var imgOpacity : CGFloat = 1
    @State var shadowOpacity: CGFloat = 0.2
    
    let scale = UIScreen.screenWidth / 414
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        self.imgName = "chika"
                        self.mainColor = UBColor(red: 234/255, green: 206/255, blue: 224/255)
                    }) {
                        let mainUIColor = UIColor(red: 234/255, green: 206/255, blue: 224/255, alpha: 1)
                        Text("千花")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding([.trailing, .leading], 20)
                            .padding([.top, .bottom], 10)
                            .background(Color(mainUIColor))
                            .cornerRadius(5)
                            .foregroundColor(.black)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color(mainUIColor), lineWidth: 5)
                            )
                    }
                    Button(action: {
                        self.imgName = "mentori"
                        self.mainColor = UBColor(red: 145/255, green: 146/255, blue: 190/255)
                    }) {
                        let mainUIColor = UIColor(red: 145/255, green: 146/255, blue: 190/255, alpha: 1)
                        
                        Text("懶得鳥你")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(18)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(mainUIColor), Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                        
                        
                        
                    }
                }
                Spacer()
                if imgName == "chika" {
                    
                    Text("髮色")
                    HStack {
                        Slider(value: $mainColor.red, in: 0...1).accentColor(.red).padding(5.0)
                        Slider(value: $mainColor.green, in: 0...1).accentColor(.green).padding(5.0)
                        Slider(value: $mainColor.blue, in: 0...1).accentColor(.blue).padding(5.0)
                    }.padding(7.0)
                    Text("瞳色")
                    HStack {
                        Slider(value: $eyeColor.red, in: 0...1).accentColor(.red).padding(5.0)
                        Slider(value: $eyeColor.green, in: 0...1).accentColor(.green).padding(5.0)
                        Slider(value: $eyeColor.blue, in: 0...1).accentColor(.blue).padding(5.0)
                    }.padding(7.0)
                    //                Slider(value: $imgOpacity, in: 0...1).accentColor(.black)
                    //                Slider(value: $shadowOpacity, in: 0...1).accentColor(.orange)
                    
                } else {
                    HStack {
                        VStack {
                            Slider(value: $mainColor.red, in: 0...1).accentColor(.red)
                            Slider(value: $mainColor.green, in: 0...1).accentColor(.green)
                            Slider(value: $mainColor.blue, in: 0...1).accentColor(.blue)
                            //                        Slider(value: $imgOpacity, in: 0...1).accentColor(.black)
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
                }
                
                
                ZStack(alignment: .top){
                    
                    //                Image(imgName)
                    //                    .resizable()
                    //                    .scaledToFit()
                    //                    .opacity(1)
                    DrawView(mainColorWithoutOpacity: self.mainColor,shadowOpacity: self.shadowOpacity, eyeColor: self.eyeColor, imgName: self.imgName, device: self.device,imgOpacity: imgOpacity).scaleEffect(CGSize(width: scale, height: scale))
                }
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
            )
        }.background(Color.white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

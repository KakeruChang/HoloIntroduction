//
//  Message.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/14.
//

import UIKit


struct Message {
    let sender: String // email
    let content: String
    let time: Date
    let bgColor: UIColor? = nil
    let textColor: UIColor? = nil
    let img: String? = nil
    
    func getMessageTimeString()-> String {
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: time)
        let minutes = calendar.component(.minute, from: time)
        
        let zone: String
        let minutesString: String
        
        
        if hour<=12 {
            zone = "上午"
            
        } else {
            zone = "下午"
            hour -= 12
        }
        
        if minutes<10 {
            minutesString = "0\(minutes)"
        } else {
            minutesString = "\(minutes)"
        }
        
        return "\(zone) \(hour):\(minutesString)"
    }
}

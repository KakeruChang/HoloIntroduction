//
//  PeopleInformation.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/27.
//

import UIKit

struct BMI {
    var color: UIColor
    var value: String
    var comment: String
}

struct PeopleInformation {
    var bmi: BMI?
    
    mutating func calculateBMI(weight: Float, height: Float){
        // bmi = String(format: "%.2f", weight / pow(height, 2))
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), value: String(format: "%.2f", bmiValue), comment: "Eat fried Chicken!")
        } else if bmiValue >= 24 {
            bmi = BMI(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), value: String(format: "%.2f", bmiValue), comment: "Only drink water!")
        } else {
            bmi = BMI(color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), value: String(format: "%.2f", bmiValue), comment: "Eat and Sleep!")
        }
    }
    
    func getBMIValue() ->String {
        // return bmi ?? "0.00"
        return bmi?.value ?? "0.00"
    }
    
    func getBMIColor() ->UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func getBMIComment() -> String {
        return bmi?.comment ?? "Default!"
    }
}


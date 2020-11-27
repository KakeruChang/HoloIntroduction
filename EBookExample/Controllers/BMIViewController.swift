//
//  BMIViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/26.
//

import UIKit

class BMIViewController: UIViewController {
    
    var people = PeopleInformation()
    // var bmi = ""

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // weightLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
        // heightLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        weightSlider.value = 80
        heightSlider.value = 1.5
    }
    
 
    @IBAction func weightOnChangeHandler(_ sender: UISlider) {
        weightLabel.text = "\(String(format: "%.2f", sender.value))KG"
    }
    @IBAction func heightOnChangeHandler(_ sender: UISlider) {
        heightLabel.text = "\(String(format: "%.2f", sender.value))M"
    }
    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        // view.endEditing(true)
        // bmi = String(format: "%.2f", weightSlider.value / pow(heightSlider.value, 2))
        people.calculateBMI(weight: weightSlider.value, height: heightSlider.value)
        
        self.performSegue(withIdentifier: "CalculateBMI", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "CalculateBMI" {
            let destination = segue.destination as! ResultBMIViewController
            // destination.bmiValue = bmi
            destination.bmiValue = people.getBMIValue()
            destination.bmiColor = people.getBMIColor()
            destination.bmiComment = people.getBMIComment()
        }
    }
}

//
//  ResultBMIViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/11/26.
//

import UIKit

class ResultBMIViewController: UIViewController {
    
    var bmiValue: String?
    var bmiColor: UIColor?
    var bmiComment: String?

    @IBOutlet weak var BMIResultLabel: UILabel!
    @IBOutlet weak var CommentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        BMIResultLabel.text = bmiValue
        CommentLabel.text = bmiComment
        view.backgroundColor = bmiColor
    }
    @IBAction func GoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        // modal: self.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
}

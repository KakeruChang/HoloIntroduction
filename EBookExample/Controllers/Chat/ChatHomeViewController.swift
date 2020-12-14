//
//  ChatHomeViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/8.
//

import UIKit

class ChatHomeViewController: UIViewController {

    @IBOutlet weak var homeSignupButton: UIButton!
    @IBOutlet weak var homeLoginButton: UIButton!
    @IBOutlet weak var chatImageWrapper: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeSignupButton.layer.borderColor = UIColor.link.cgColor
        homeSignupButton.layer.borderWidth = 2
        
        chatHomeAnimation()
    }
    
    @IBAction func backToChatHome(_ unwindSegue: UIStoryboardSegue) {
        chatImageWrapper.alpha = 1
        chatHomeAnimation()
    }
    
    func displayText(text: String, button: UIButton){
        var memo = ""
        
        for (i, letter) in text.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.2 * Double(i), repeats: false) { (Timer) in
                memo.append(letter)
                button.setTitle(memo, for: .normal)
            }
        }
    }
    
    func chatHomeAnimation() {
        // image animation
        UIView.animate(withDuration: 1,
                                   delay: 0,
                                   options: [.autoreverse, .repeat],
                                   animations: {
                                    self.chatImageWrapper.alpha = 0
                                   },
                                   completion: nil)
        
        // button text animation
        displayText(text: "Sign up", button: homeSignupButton)
        displayText(text: "Log in", button: homeLoginButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




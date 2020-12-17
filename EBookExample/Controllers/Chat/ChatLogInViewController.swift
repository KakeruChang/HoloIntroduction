//
//  ChatLogInViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/8.
//

import UIKit
import Firebase

class ChatLogInViewController: UIViewController {
    
    @IBOutlet weak var accountTexttField: UITextField!
    @IBOutlet weak var passwordTexttField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        
        loginTextFieldStyling(textField: accountTexttField, placeholder: "E-mail")
        loginTextFieldStyling(textField: passwordTexttField, placeholder: "password")
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let account = accountTexttField.text, let password = passwordTexttField.text {
            performSegue(withIdentifier: "LoginToChat", sender: self)
//            Auth.auth().signIn(withEmail: account, password: password) { authResult, error in
//
//                if let error = error {
//                    print(error.localizedDescription)
//                } else {
//                    // guard let strongSelf = self else { return }
//                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
//                }
//            }
        }
    }
    
    
    func loginTextFieldStyling(textField: UITextField, placeholder: String){
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textField.layer.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
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

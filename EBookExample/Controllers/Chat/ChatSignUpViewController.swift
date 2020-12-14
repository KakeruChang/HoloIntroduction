//
//  ChatSignUpViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/8.
//

import UIKit
import Firebase

class ChatSignUpViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        
        signupTextFieldStyling(textField: accountTextField, placeholder: "E-mail")
        signupTextFieldStyling(textField: passwordTextField, placeholder: "password")
        
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
        if let account = accountTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: account, password: password) { authResult, error in
                
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "SignupToChat", sender: self)
                }
            }
        }
    }
    
    
    func signupTextFieldStyling(textField: UITextField, placeholder: String){
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
}

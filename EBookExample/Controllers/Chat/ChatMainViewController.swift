//
//  ChatMainViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/9.
//

import UIKit
import Firebase

class ChatMainViewController: UIViewController {
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageInput: UITextField!
    
    var messages: [Message] = [
        Message(sender: "test@gmail.com", content: "Hello, how are you?", time:
                    DateComponents(calendar: Calendar.current, year: 2018, month: 2, day: 7, hour: 18, minute: 30, second: 20).date! ) ,
        Message(sender: "abc@gmail.com", content: "I am fine, thank you", time:
                    DateComponents(calendar: Calendar.current, year: 2018, month: 2, day: 9, hour: 04, minute: 01, second: 20).date! ),
        Message(sender: "test@gmail.com", content: "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest", time: DateComponents(calendar: Calendar.current, year: 2018, month: 2, day: 11, hour: 15, minute: 52, second: 20).date! ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.dataSource = self
        messageTableView.delegate = self
        
        navigationItem.hidesBackButton = true
        title = "Holo Chat"
        
        messageTableView.register(UINib(nibName: "MessageSelfTextCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        messageTableView.register(UINib(nibName: "MessageOtherTextCell", bundle: nil), forCellReuseIdentifier: "ReusableCellOther")
    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("log out success")
            // navigationController?.popToRootViewController(animated: true)
            performSegue(withIdentifier: "backToHome", sender: self)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - UITableViewDataSource
extension ChatMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // decide self or other
        var testResult = false
        if indexPath.row % 2 == 0 {
            testResult = true
        }
        
        if testResult == true {
            // self bubble
            let selfCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageSelfTextCell
            selfCell.messageLabel.text = messages[indexPath.row].content
            
            return selfCell
        }
        
        // other bubble
        let otherCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCellOther", for: indexPath) as! MessageOtherTextCell
        otherCell.messageLabel.text = messages[indexPath.row].content
        
        return otherCell
    }
}

//MARK: - UITableViewDelegate
extension ChatMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}



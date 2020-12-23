//
//  ChatMainViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/9.
//

import UIKit
import Firebase


// MARK: - UIViewController
class ChatMainViewController: UIViewController {
    
    @IBOutlet var messageWrapper: UIView!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageInput: UITextField!
    @IBOutlet weak var sendImage: UIImageView!
    
    @IBOutlet weak var textfieldBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableViewTopConstraints: NSLayoutConstraint!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.dataSource = self
        messageTableView.delegate = self
        messageInput.delegate = self
        
        //let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //self.messageTableView.addGestureRecognizer(tap)
        
        
        navigationItem.hidesBackButton = true
        title = "Holo Chat"
        
        messageTableView.register(UINib(nibName: "MessageSelfTextCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        messageTableView.register(UINib(nibName: "MessageOtherTextCell", bundle: nil), forCellReuseIdentifier: "ReusableCellOther")
        
        loadMessages()
    }
    
    func loadMessages(){
        
        db.collection("messages").order(by: "time").addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let snapshotDocument = querySnapshot?.documents {
                    for doc in snapshotDocument {
                        let data = doc.data()
                        
                        if let account = data["account"] as? String, let message = data["message"] as? String, let timestamp = data["time"] as? Timestamp {
                            let time = timestamp.dateValue()
                            let newMessage = Message(sender: account, content: message, time: time)
                            
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.messageTableView.reloadData()
                                
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.messageTableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                        } else {
                            print("sth wrong")
                        }
                        
                    }
                }
            }
        }
        
    }
    
    @IBAction func sendMessage(_ sender: UIControl) {
        if let messageBody = messageInput.text, let account = Auth.auth().currentUser?.email {
            
            let time = Date()
            
            if messageBody.count > 0 {
                db.collection("messages").addDocument(data: ["account": account, "message": messageBody, "time": time]) { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Successfully saved data.")
                        self.messageInput.text = nil
                        self.sendImage.image = UIImage(systemName: "hand.thumbsup.fill")
                    }
                }
            }
            
        }
    }
    
    @IBAction func textIsInputting(_ sender: UITextField) {
        let message = sender.text
        if message == nil || message == "" {
            sendImage.image = UIImage(systemName: "hand.thumbsup.fill")
        } else {
            sendImage.image = UIImage(systemName: "paperplane.fill")
        }
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

// MARK: - UITableViewDataSource
extension ChatMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    // MessageTableViewCell
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
            selfCell.timeLabel.text = messages[indexPath.row].getMessageTimeString()
            selfCell.contentView.layoutIfNeeded()
            
            return selfCell
        }
        
        // other bubble
        let otherCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCellOther", for: indexPath) as! MessageOtherTextCell
        otherCell.messageLabel.text = messages[indexPath.row].content
        otherCell.timeLabel.text = messages[indexPath.row].getMessageTimeString()
        otherCell.contentView.layoutIfNeeded()
        
        return otherCell
    }
}

// MARK: - UITableViewDelegate
extension ChatMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(indexPath.row)
    }
}

// MARK: - UITextFieldDelegate
extension ChatMainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}


// MARK: - UIViewController( keyboard )
extension ChatMainViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillAppear(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let tabbarHeight = messageWrapper.safeAreaInsets.bottom
            
            
            messageWrapper.frame.origin.y = -keyboardHeight
            textfieldBottomConstraints.constant = tabbarHeight
            tableViewTopConstraints.constant = keyboardHeight
            messageWrapper.layoutIfNeeded()
            
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            messageTableView.scrollToRow(at: indexPath, at: .top, animated: false)
            
            // add gesture recognizer
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            self.messageTableView.addGestureRecognizer(tap)
        }
    }
    
    @objc func keyboardWillDisappear() {
        messageWrapper.frame.origin.y = 0
        textfieldBottomConstraints.constant = 0
        tableViewTopConstraints.constant = 0
        messageWrapper.layoutIfNeeded()
        
        // remove gesture recognizer
        self.messageTableView.gestureRecognizers?.forEach(self.messageTableView.removeGestureRecognizer)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

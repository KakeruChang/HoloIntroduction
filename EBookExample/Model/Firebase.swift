//
//  Firebase.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/23.
//

import Foundation
import Firebase

let db = Firestore.firestore()

func loadMessages(chatMainViewController: ChatMainViewController){
    
    db.collection("messages").order(by: "time").addSnapshotListener { (querySnapshot, error) in
        chatMainViewController.messages = []
        
        if let error = error {
            print(error.localizedDescription)
        } else {
            if let snapshotDocument = querySnapshot?.documents {
                for doc in snapshotDocument {
                    let data = doc.data()
                    
                    if let account = data["account"] as? String, let message = data["message"] as? String, let timestamp = data["time"] as? Timestamp {
                        let time = timestamp.dateValue()
                        let newMessage: Message
                        
                        if let img = data["img"] as? String {
                            newMessage = Message(sender: account, content: message, time: time, img: img)
                        } else {
                            newMessage = Message(sender: account, content: message, time: time)
                        }
                        
                        chatMainViewController.messages.append(newMessage)
                        
                        DispatchQueue.main.async {
                            chatMainViewController.messageTableView.reloadData()
                            
                            let indexPath = IndexPath(row: chatMainViewController.messages.count - 1, section: 0)
                            chatMainViewController.messageTableView.scrollToRow(at: indexPath, at: .top, animated: false)
                        }
                        
                    } else {
                        print("sth wrong")
                    }
                    
                }
            }
        }
    }
    
}

func sendMessageToFirebase(_ account: String, _ messageBody: String, _ time: Date, chatMainViewController: ChatMainViewController) {
    
    
    db.collection("messages").addDocument(data: ["account": account, "message": messageBody, "time": time]) { (error) in
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Successfully saved data.")
            chatMainViewController.messageInput.text = nil
            chatMainViewController.sendImage.image = UIImage(systemName: "hand.thumbsup.fill")
        }
    }
}

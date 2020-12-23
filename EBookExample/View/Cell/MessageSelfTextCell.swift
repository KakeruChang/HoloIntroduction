//
//  MessageSelfTextCell.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/15.
//

import UIKit

class MessageSelfTextCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIControl!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var trigger = false
    var isSelf = true
    var bubbleColor = UIColor(red: 47/255, green: 124/255, blue: 246/255, alpha: 1).cgColor
    var bubbleDeepColor = UIColor(red: 47/255, green: 100/255, blue: 246/255, alpha: 1).cgColor
    
    @IBAction func messageIsClicking(_ sender: UIControl) {
        messageBubble.layer.backgroundColor = bubbleDeepColor
        drawMessageAngle(messageBubble: messageBubble, isSelf: isSelf, bubbleColor: bubbleDeepColor)
    }
    
    @IBAction func messageIsClicked(_ sender: UIControl) {
        messageBubble.layer.backgroundColor = bubbleColor
        drawMessageAngle(messageBubble: messageBubble, isSelf: isSelf, bubbleColor: bubbleColor)
        
        if let text = messageLabel.text {
            print(text)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = 20
        messageBubble.layer.backgroundColor = bubbleColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()

        drawMessageAngle(messageBubble: messageBubble, isSelf: isSelf, bubbleColor: bubbleColor)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

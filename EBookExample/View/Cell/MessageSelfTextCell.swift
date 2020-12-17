//
//  MessageSelfTextCell.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/15.
//

import UIKit

class MessageSelfTextCell: UITableViewCell {
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageWrapper: UIView!
    
    var trigger = false
    var isSelf = true
    var bubbleColor = UIColor(red: 47/255, green: 124/255, blue: 246/255, alpha: 1).cgColor
    
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
        messageWrapper.layer.backgroundColor = UIColor.systemBackground.cgColor
    }
    
}

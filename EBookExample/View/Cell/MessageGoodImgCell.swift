//
//  MessageGoodImgCell.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/23.
//

import UIKit

class MessageGoodImgCell: UITableViewCell {

    let bubble = UIView()
    let goodWrapper = UIControl()
    let good = UIImageView()
    let timeLabel = UILabel()
    var isSelf: Bool = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print("override init?")
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        good.image = UIImage(systemName: "hand.thumbsup.fill")
        timeLabel.font = timeLabel.font.withSize(12)
        
        contentView.addSubview(bubble)
        bubble.addSubview(goodWrapper)
        goodWrapper.addSubview(good)
        bubble.addSubview(timeLabel)
        
        bubble.translatesAutoresizingMaskIntoConstraints = false
        let bubbleHeightConstraint = NSLayoutConstraint(item: bubble, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        bubbleHeightConstraint.isActive = true
        NSLayoutConstraint(item: bubble, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: bubble, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 10).isActive = true
        let bubbleTopConstraint = NSLayoutConstraint(item: bubble, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 10)
        bubbleTopConstraint.priority = UILayoutPriority(rawValue: 999)
        bubbleTopConstraint.isActive = true
        let bubbleBottomConstraint = NSLayoutConstraint(item: bubble, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -10)
        bubbleBottomConstraint.priority = UILayoutPriority(rawValue: 999)
        bubbleBottomConstraint.isActive = true
        
        goodWrapper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: goodWrapper, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: goodWrapper, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: goodWrapper, attribute: .trailing, relatedBy: .equal, toItem: bubble, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: goodWrapper, attribute: .top, relatedBy: .equal, toItem: bubble, attribute: .top, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: goodWrapper, attribute: .bottom, relatedBy: .equal, toItem: bubble, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
        
        good.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: good, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: good, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        NSLayoutConstraint(item: good, attribute: .trailing, relatedBy: .equal, toItem: goodWrapper, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: good, attribute: .leading, relatedBy: .equal, toItem: goodWrapper, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: good, attribute: .top, relatedBy: .equal, toItem: goodWrapper, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: good, attribute: .bottom, relatedBy: .equal, toItem: goodWrapper, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: good, attribute: .leading, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: timeLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
        NSLayoutConstraint(item: timeLabel, attribute: .bottom, relatedBy: .equal, toItem: bubble, attribute: .bottom, multiplier: 1, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        print("required init?")
        super.init(coder: coder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
print("test")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


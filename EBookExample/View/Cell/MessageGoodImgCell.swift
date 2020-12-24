//
//  MessageGoodImgCell.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/23.
//
import SnapKit

class MessageGoodImgCell: UITableViewCell {
    
    let bubble = UIView()
    let goodWrapper = UIControl()
    let good = UIImageView()
    let timeLabel = UILabel()
    
    var isSelf: Bool = true
    let goodDeepColor = UIColor(red: 47/255, green: 100/255, blue: 246/255, alpha: 1)
    
    let otherImageWrapper = UIControl()
    let otherImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        good.image = UIImage(systemName: "hand.thumbsup.fill")
        timeLabel.font = timeLabel.font.withSize(12)
        goodWrapper.addTarget(self, action: #selector(touchUpGood(sender:)), for: .touchUpInside)
        goodWrapper.addTarget(self, action: #selector(touchDownGood(sender:)), for: .touchDown)

        
        contentView.addSubview(bubble)
        bubble.addSubview(goodWrapper)
        goodWrapper.addSubview(good)
        bubble.addSubview(timeLabel)
        
        initSelfCell()
    }
    
    required init?(coder: NSCoder) {
        print("required init?")
        super.init(coder: coder)!
    }
    
    @objc private func touchUpGood(sender: UIControl) {
        print("good:\(timeLabel.text ?? "default")")
        good.image = UIImage(systemName: "hand.thumbsup.fill")
    }
    @objc private func touchDownGood(sender: UIControl) {
        let imageIcon = UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(goodDeepColor, renderingMode: .alwaysOriginal)
        good.image = imageIcon
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if isSelf == false {
            setToOtherCell()
        } else {
            setToSelfCell()
        }
        contentView.layoutIfNeeded()
    }
    
    func initSelfCell(){
        bubble.snp.remakeConstraints { (make) -> Void in
            make.height.equalTo(60)
            make.left.right.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(10).priority(999)
        }

        setToSelfCell()
    }
    
    func setToSelfCell(){
        otherImageWrapper.removeFromSuperview()
        
        goodWrapper.snp.remakeConstraints { (make) -> Void in
            make.height.width.equalTo(40)
            make.right.top.bottom.equalToSuperview().inset(10)
        }

        good.snp.remakeConstraints { (make) -> Void in
            make.height.width.equalTo(40)
            make.left.right.top.bottom.equalToSuperview()
        }

        timeLabel.snp.remakeConstraints { (make) -> Void in
            make.width.equalTo(60)
            make.right.equalTo(goodWrapper.snp.left).inset(5)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    func setToOtherCell(){
        otherImage.image = UIImage(systemName: "person.fill")
        bubble.addSubview(otherImageWrapper)
        otherImageWrapper.addSubview(otherImage)
        
        otherImageWrapper.snp.remakeConstraints { (make) -> Void in
            make.width.height.equalTo(40)
            make.bottom.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(0)
        }
        
        otherImage.snp.remakeConstraints { (make) -> Void in
            make.width.height.equalTo(40)
            make.bottom.left.right.top.equalToSuperview()
        }
        
        goodWrapper.snp.remakeConstraints { (make) -> Void in
            make.height.width.equalTo(40)
            make.left.equalTo(otherImageWrapper.snp.right).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }

        timeLabel.snp.remakeConstraints { (make) -> Void in
            make.width.equalTo(60)
            make.left.equalTo(goodWrapper.snp.right).offset(5)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

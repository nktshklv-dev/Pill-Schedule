//
//  TimestampCollectionViewCell.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/14/23.
//

import UIKit

class TimestampCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "TimestampCollectionViewCell"
    private var isChosen: Bool = false
    public let myLabel: UILabel = {
        let label = UILabel()
        label.text = "My label"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = R.color.gray2()
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = R.color.gray4()
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(x: 10, y: contentView.frame.size.height - 40, width: contentView.frame.size.width - 15, height: 40)
    }
    
    public func configure(text: String){
        myLabel.text = text
    }
    
    public func changeState(isChosen: Bool){
       
            if isChosen{
                self.myLabel.textColor = R.color.dark()
                self.contentView.backgroundColor = R.color.gray4()
                self.contentView.layer.cornerRadius = 20
                self.contentView.layer.opacity = 100
                self.isChosen = !isChosen
            }
            else {
                self.myLabel.textColor = R.color.gray2()
                self.contentView.backgroundColor = .clear
                self.contentView.layer.opacity = 100
                self.isChosen = !isChosen
            }
    }
    
    func setText(to text: String) {
        myLabel.text = text
    }
    
}

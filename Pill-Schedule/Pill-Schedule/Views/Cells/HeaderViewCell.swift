//
//  HeaderViewCell.swift
//  Pills
//
//  Created by Nikita  on 3/21/23.
//

import UIKit
import SnapKit

class HeaderViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HeaderViewCell"
    private let dateLabel = UILabel()
    private let greetingLabel = UILabel()
    private let openHistoryButton = UIButton()
    private let openPreferencesButton = UIButton()
    var delegate: MenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.backgroundColor = .clear
        
        dateLabel.text = "Monday"
        dateLabel.textColor = R.color.dark()
        dateLabel.font = UIFont.boldSystemFont(ofSize: 34)
        self.addSubview(dateLabel)
        
        greetingLabel.text = "Hey, Sasha!"
        greetingLabel.textColor = R.color.gray()
        greetingLabel.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(greetingLabel)
        
        openHistoryButton.setImage(R.image.showRecentDatesButton(), for: .normal)
        self.addSubview(openHistoryButton)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 34, weight: .medium, scale: .medium)
        let largeBoldAccountIcon = UIImage(systemName: "person.crop.circle", withConfiguration: symbolConfiguration)
        
        openPreferencesButton.setImage(largeBoldAccountIcon, for: .normal)
        openPreferencesButton.tintColor = R.color.blue()
        openPreferencesButton.addTarget(self, action: #selector(tappedPreferences), for: .touchUpInside)
        self.addSubview(openPreferencesButton)
    }
    private func setupConstraints(){
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.left.equalTo(self.snp.left).inset(-10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(5)
            make.left.equalTo(greetingLabel.snp.left)
        }
        
        openHistoryButton.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.right).offset(9)
            make.top.equalTo(dateLabel.snp.top).offset(13)
        }
        
        openPreferencesButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.trailing.equalTo(self.snp.trailing).inset(50)
            make.top.equalTo(greetingLabel.snp.top)
        }
    }
    
    @objc private func tappedPreferences(){
        delegate?.showMenu()
    }

}

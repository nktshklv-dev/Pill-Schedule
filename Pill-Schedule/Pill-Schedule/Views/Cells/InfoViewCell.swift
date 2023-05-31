//
//  InfoViewCell.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import UIKit
import SnapKit

class InfoViewCell: UICollectionViewCell {
    
    static var identifier = "InfoViewCell"
    var mainTitle = UILabel()
    var secondaryTitle = UILabel()
    private var arrowIndicator = UIImageView()
    private var progressBar: CircularProgressView!
    private var progressPercentage = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        //self
        self.layer.cornerRadius = 24
        self.layer.borderWidth = 2
        self.layer.borderColor = R.color.gray3()?.cgColor
        
        mainTitle.font = UIFont.boldSystemFont(ofSize: 24)
        mainTitle.textColor = R.color.dark()
        mainTitle.text = "Your plan is\nalmost done!"
        mainTitle.numberOfLines = 0
        self.addSubview(mainTitle)
        
        //secondaryTitle setup
        secondaryTitle.font = UIFont.systemFont(ofSize: 16)
        secondaryTitle.textColor = R.color.gray()
        //mock text
        secondaryTitle.text = "13% than week ago"
        self.addSubview(secondaryTitle)
        
        //arrowIndicator setup
        arrowIndicator.image = R.image.upArrow()
        self.addSubview(arrowIndicator)
        
        //progressBar
        progressBar = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 86, height: 86), lineWidth: 10, rounded: false)
        progressBar.progress.round()
        progressBar.progressColor = R.color.green()!
        progressBar.trackColor = R.color.green2()!
        progressBar.progress = 0.78
        self.addSubview(progressBar)
    }
    private func setupLayout(){
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.left.equalTo(self.snp.left).offset(24)
        }
        
        arrowIndicator.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(15)
            make.left.equalTo(mainTitle.snp.left)
        }
        secondaryTitle.snp.makeConstraints { make in
            if arrowIndicator.image == R.image.upArrow(){
                make.top.equalTo(arrowIndicator.snp.top).offset(-4)
                make.left.equalTo(arrowIndicator.snp.right).offset(3)
            }
            else {
                make.top.equalTo(arrowIndicator.snp.top).offset(-5)
                make.left.equalTo(arrowIndicator.snp.right).offset(3)
                
            }
            
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.top)
            make.right.equalTo(mainTitle.snp.right).offset(45)
        }
        
    }
}

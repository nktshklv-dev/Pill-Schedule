//
//  FirstCreatePillViewController+CreateSubviews.swift
//  Pills
//
//  Created by Nikita  on 4/17/23.
//

import Foundation
import UIKit

extension FirstCreatePillViewController {
    
     func setupViews(){
        pageNumberLabel = UILabel()
        pageNumberLabel.text = "1 of 2"
        pageNumberLabel.textColor = R.color.gray()
        pageNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.view.addSubview(pageNumberLabel)
        
        titleLabel = UILabel()
        titleLabel.text = "Add medication"
        titleLabel.textColor = R.color.dark()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        self.view.addSubview(titleLabel)
        
        pillsView = ChoosePillButtonView()
        self.view.addSubview(pillsView)
        
    }

     func setupConstraints(){
        pageNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(pageNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(pageNumberLabel.snp.left)
        }
        
        pillsView.snp.makeConstraints { make in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.9)
            make.height.equalTo(100)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
}

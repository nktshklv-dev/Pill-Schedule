//
//  AccountSettingsView+LoggedInSetup.swift
//  Pill-Schedule
//
//  Created by Nikita  on 5/31/23.
//

import Foundation
import UIKit

extension AccountSettingsView {
    
    func setupLoggedInView(){
        mainView = UIView()
        self.addSubview(mainView)
        
        userProfilePictureView = UIImageView()
        userProfilePictureView.image = R.image.basicPP()
        mainView.addSubview(userProfilePictureView)
        
        userNameLabel = UILabel()
        userNameLabel.text = "Name"
        userNameLabel.textAlignment = .center
        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        userNameLabel.textColor = R.color.dark()
        mainView.addSubview(userNameLabel)
        
        userSurnameLabel = UILabel()
        userSurnameLabel.text = "Surname"
        userSurnameLabel.textAlignment = .center
        userSurnameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        userSurnameLabel.textColor = R.color.dark()
        mainView.addSubview(userSurnameLabel)
        
        editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(R.color.blue(), for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        mainView.addSubview(editButton)
        
        logOutButton = UIButton(type: .roundedRect)
        logOutButton.layer.cornerRadius = 20
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.setTitleColor(.black, for: .normal)
        logOutButton.backgroundColor = R.color.gray2()
        mainView.addSubview(logOutButton)
    }
    
    func setupLoggedInConstraints() {
        let width = UIScreen.main.bounds.width
        
        userProfilePictureView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(20)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(30)
        }
        
        userSurnameLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(20)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.top.equalTo(self.snp.top).offset(62)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalTo(userProfilePictureView)
            make.bottom.equalTo(self.snp.bottom).offset(-70)
        }
        
        
        
    }
}

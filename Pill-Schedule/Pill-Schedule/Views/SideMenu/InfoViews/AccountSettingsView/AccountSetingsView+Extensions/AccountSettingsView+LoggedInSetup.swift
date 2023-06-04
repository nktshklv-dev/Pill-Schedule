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
        userProfilePictureView.layer.cornerRadius = 50
        userProfilePictureView.clipsToBounds = true
        userProfilePictureView.image = retrieveProfilePictureLocally()
        mainView.addSubview(userProfilePictureView)
        
        userNameLabel = UILabel()
        userNameLabel.text = user?.email
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
        editButton.addTarget(self, action: #selector(toggleEditMode), for: .touchUpInside)
        mainView.addSubview(editButton)
        
        logOutButton = UIButton(type: .roundedRect)
        logOutButton.layer.cornerRadius = 20
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.setTitleColor(.black, for: .normal)
        logOutButton.backgroundColor = R.color.gray2()
        logOutButton.addTarget(self, action: #selector(didTapLogOut), for: .touchUpInside)
        self.addSubview(logOutButton)
        
        progressSpinner = UIActivityIndicatorView()
        progressSpinner.stopAnimating()
        progressSpinner.alpha = 0 
        self.addSubview(progressSpinner)
    }
    
    func setupLoggedInConstraints() {
        let width = UIScreen.main.bounds.width
        
        self.mainView.snp.makeConstraints { make in
            make.height.equalTo(self)
            make.width.equalTo(self)
            make.top.equalTo(self)
            make.left.equalTo(self)
        }
        
        userProfilePictureView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        
        progressSpinner.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(userProfilePictureView)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(20)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(30)
        }
        
        userSurnameLabel.snp.makeConstraints { make in
            make.width.equalTo(userNameLabel)
            make.height.equalTo(userNameLabel)
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

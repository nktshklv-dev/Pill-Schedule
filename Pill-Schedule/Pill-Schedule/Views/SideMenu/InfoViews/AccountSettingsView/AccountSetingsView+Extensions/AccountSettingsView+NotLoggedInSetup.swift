//
//  AccountSettingsView+NotLoggedInSetup.swift
//  Pill-Schedule
//
//  Created by Nikita  on 5/31/23.
//

import Foundation
import UIKit

extension AccountSettingsView {
    
    func setupNotLoggedInView(){
        
        userProfilePictureView = UIImageView()
        userProfilePictureView.image = R.image.basicPP()
        userProfilePictureView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(userProfilePictureView)
        
        userNameLabel = UILabel()
        userNameLabel.text = "You're not logged in :("
        userNameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        mainView.addSubview(userNameLabel)
        
        logInPromptLabel = UILabel()
        logInPromptLabel.text = "With an account in Pills, you will be able to store your data online."
        logInPromptLabel.numberOfLines = 0
        logInPromptLabel.textAlignment = .center
        logInPromptLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        mainView.addSubview(logInPromptLabel)
        
        registerButton = UIButton()
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = R.color.blue()
        registerButton.layer.cornerRadius = 21
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        registerButton.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
        mainView.addSubview(registerButton)
        
        alreadyHaveAnAccLabel = UILabel()
        alreadyHaveAnAccLabel.text = "Already have an account in Pills?"
        alreadyHaveAnAccLabel.textColor = R.color.gray()
        alreadyHaveAnAccLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        mainView.addSubview(alreadyHaveAnAccLabel)
        
        logInButton = UIButton()
        logInButton.setTitle("Sign In", for: .normal)
        logInButton.setTitleColor(R.color.blue(), for: .normal)
        logInButton.backgroundColor = UIColor(red: 0.67, green: 0.84, blue: 0.9, alpha: 0.3)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        logInButton.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
        logInButton.layer.cornerRadius = 20
        mainView.addSubview(logInButton)
        
        logInView = LogInView()
        logInView.parentView = self
        mainView.addSubview(logInView)
    }
    
    func setupNotLoggedInConstraints() {
        let width = UIScreen.main.bounds.width
    
        self.logInView.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.top.equalTo(self)
            make.left.equalTo(self.snp.right)
        }
        userProfilePictureView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(170)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(15)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        logInPromptLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.width.equalTo(self).multipliedBy(0.8)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(42)
            make.top.equalTo(logInPromptLabel.snp.bottom).offset(20)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        alreadyHaveAnAccLabel.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(110)
            make.top.equalTo(alreadyHaveAnAccLabel.snp.bottom).offset(15)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
    }
    
}

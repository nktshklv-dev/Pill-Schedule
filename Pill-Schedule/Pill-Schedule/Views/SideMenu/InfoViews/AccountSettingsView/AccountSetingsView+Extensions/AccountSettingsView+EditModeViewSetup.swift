//
//  AccountSettingsView+EditModeViewSetup.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/2/23.
//

import Foundation
import UIKit

extension AccountSettingsView {
    
    func setupEditModeView() {
        
        mainView = UIView()
        self.addSubview(mainView)
        
        userProfilePictureView = UIImageView()
        userProfilePictureView.image = R.image.basicPP()
        mainView.addSubview(userProfilePictureView)
        
        changeProfilePicButton = UIButton()
        changeProfilePicButton.setTitle("Set profile photo", for: .normal)
        changeProfilePicButton.setTitleColor(R.color.blue(), for: .normal)
        changeProfilePicButton.titleLabel?.textAlignment = .center
        changeProfilePicButton.menu = menu
        changeProfilePicButton.showsMenuAsPrimaryAction = true 
        self.addSubview(changeProfilePicButton)
        
        editNameTextField = UITextField()
        editNameTextField.borderStyle = .roundedRect
        editNameTextField.placeholder = "Name"
        self.addSubview(editNameTextField)
        
        editSurnameTextField = UITextField()
        editSurnameTextField.borderStyle = .roundedRect
        editSurnameTextField.placeholder = "Surname"
        self.addSubview(editSurnameTextField)
        
        editButton = UIButton()
        editButton.setTitle("Done", for: .normal)
        editButton.setTitleColor(R.color.blue(), for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        editButton.addTarget(self, action: #selector(toggleEditMode), for: .touchUpInside)
        self.addSubview(editButton)
    }
    
    func setupEditModeConstraints() {
        let width = UIScreen.main.bounds.width
        
        userProfilePictureView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        
        changeProfilePicButton.snp.makeConstraints { make in
            make.width.equalTo(userProfilePictureView).multipliedBy(2)
            make.height.equalTo(30)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(10)
        }
        
        editNameTextField.snp.makeConstraints { make in
            make.width.equalTo(userProfilePictureView).multipliedBy(2.7)
            make.height.equalTo(30)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(60)
        }
        
        editSurnameTextField.snp.makeConstraints { make in
            make.width.equalTo(editNameTextField)
            make.height.equalTo(editNameTextField)
            make.centerX.equalTo(userProfilePictureView)
            make.top.equalTo(editNameTextField.snp.bottom).offset(10)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.top.equalTo(self.snp.top).offset(62)
            make.right.equalTo(self.snp.right).offset(-20)
        }
    }
    
}

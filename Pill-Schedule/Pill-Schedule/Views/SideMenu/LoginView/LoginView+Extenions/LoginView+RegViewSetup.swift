//
//  LoginView+RegViewSetup.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/1/23.
//

import Foundation
import UIKit

extension LogInView {
    func setupRegistrationView(){
        promptLabel = UILabel()
        promptLabel.text = "Registration"
        promptLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.addSubview(promptLabel)
        
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.delegate = self
        emailTextField.backgroundColor = .white
        emailTextField.borderStyle = .roundedRect
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        emailTextField.clearButtonMode = .whileEditing
        self.addSubview(emailTextField)
        
        emailTextFieldLabel = UILabel()
        emailTextFieldLabel.text = ""
        emailTextFieldLabel.textColor = R.color.orange()
        emailTextFieldLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.addSubview(emailTextFieldLabel)
        
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
        self.addSubview(passwordTextField)
        
        secondPasswordTextField = UITextField()
        secondPasswordTextField.delegate = self
        secondPasswordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        secondPasswordTextField.placeholder = "Repeat Password"
        secondPasswordTextField.borderStyle = .roundedRect
        secondPasswordTextField.isSecureTextEntry = true
        self.addSubview(secondPasswordTextField)
        
        passwordTextFieldLabel = UILabel()
        passwordTextFieldLabel.text = ""
        passwordTextFieldLabel.textColor = R.color.orange()
        passwordTextFieldLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        self.addSubview(passwordTextFieldLabel)
        
        continueButton = UIButton()
        continueButton.isUserInteractionEnabled = false
        continueButton.setTitleColor(.black, for: .normal)
        continueButton.backgroundColor = R.color.gray2()
        continueButton.layer.cornerRadius = 25
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.addSubview(continueButton)
        
        spinningProgressView = SpinningProgressView()
        spinningProgressView.alpha = 0
        self.addSubview(spinningProgressView)
    }
    
    func setupRegistrationConstraints() {
        promptLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(self.snp.top).inset(130)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(promptLabel).multipliedBy(1.7)
            make.height.equalTo(35)
            make.top.equalTo(promptLabel.snp.bottom).offset(75)
            make.centerX.equalTo(promptLabel)
        }
        emailTextFieldLabel.snp.makeConstraints { make in
            make.left.equalTo(emailTextField.snp.left)
            make.bottom.equalTo(emailTextField.snp.top).offset(-5)
        }
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalTo(promptLabel)
        }
        secondPasswordTextField.snp.makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.centerX.equalTo(promptLabel)
        }
        passwordTextFieldLabel.snp.makeConstraints { make in
            make.top.equalTo(secondPasswordTextField.snp.bottom).offset(10)
            make.left.equalTo(secondPasswordTextField.snp.left)
        }
        continueButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom).inset(75)
            make.centerX.equalTo(promptLabel)
        }
        
        spinningProgressView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalTo(promptLabel)
            make.centerY.equalTo(self)
        }
    }
}

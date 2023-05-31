//
//  LoginView+TextFieldDelegate.swift
//  Pills
//
//  Created by Nikita  on 5/7/23.
//

import Foundation
import UIKit

extension LogInView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        return true
    }
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        textField.text = text.lowercased()
        if passedEmailFormatCheck(email: text){
            didPassEmailCheck(textField)
        }
        else {
            didNotPassEmailCheck(textField)
        }
        print("1")
    }
    
    func passedEmailFormatCheck(email: String) -> Bool {
        return email.isValid(.email)
    }
    
    func didNotPassEmailCheck(_ textfield: UITextField){
        textfield.layer.borderWidth = 3
        textfield.layer.borderColor = R.color.orange()?.cgColor
        emailTextFieldLabel.text = "Please enter a valid email address."
        emailFieldValid = false
    }
    func didPassEmailCheck(_ textfield: UITextField){
        textfield.layer.borderColor = R.color.green()?.cgColor
        emailTextFieldLabel.text = ""
        emailTextFieldLabel.textColor = R.color.orange()
        emailFieldValid = true
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField){
        switch showCase{
        case .registration:
            guard let p1 = passwordTextField.text else {return}
            guard let p2 = secondPasswordTextField.text else {return}
            guard p1 != "" && p2 != "" else {return}
            if p1 == p2 {
                checkPasswordsPassed()
            }
            else {
                checkPasswordsDidNotPassed()
            }
        case .login:
            guard let p1 = passwordTextField.text else {return}
            guard p1 != "" else {return}
            checkPasswordsPassed()
            
        default: print("Default")
            
        }
       
    }
    
    func checkPasswordsPassed(){
        passwordTextFieldLabel.text = ""
        passwordTextField.layer.borderWidth = 3
        secondPasswordTextField.layer.borderWidth = 3
        passwordTextField.layer.borderColor = R.color.green()?.cgColor
        secondPasswordTextField.layer.borderColor = R.color.green()?.cgColor
        passwordFieldsValid = true
    }
    func checkPasswordsDidNotPassed(){
        passwordTextFieldLabel.text = "Passwords don't match!"
        secondPasswordTextField.layer.borderWidth = 3
        secondPasswordTextField.layer.borderColor = R.color.orange()?.cgColor
        passwordTextField.layer.borderWidth = 0
        passwordFieldsValid = false
    }
    
    func passwordsNotValid() {
        passwordTextFieldLabel.text = "Password length should be 6-12 characters"
    }
}


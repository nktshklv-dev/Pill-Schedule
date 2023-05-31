//
//  LoginView+Actions.swift
//  Pills
//
//  Created by Nikita  on 5/7/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension LogInView {
    
    @objc func didTapBackButton(){
        parentView.hideLoginView()
        emailTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
        secondPasswordTextField.layer.borderWidth = 0
        continueButton.isUserInteractionEnabled = false
        deleteLayers()
        parentView.user = user
    }
    
    func deleteLayers() {
        promptLabel.removeFromSuperview()
        emailTextField.removeFromSuperview()
        passwordTextField.removeFromSuperview()
        secondPasswordTextField.removeFromSuperview()
        continueButton.removeFromSuperview()
        backButton.removeFromSuperview()
        emailTextFieldLabel.removeFromSuperview()
        passwordTextFieldLabel.removeFromSuperview()
        
    }
    
    func openContinueButton() {
        if emailFieldValid && passwordFieldsValid {
            continueButton.isUserInteractionEnabled = true
            continueButton.backgroundColor = R.color.blue()
        }
        else {
            continueButton.isUserInteractionEnabled = false
            continueButton.backgroundColor = R.color.gray2()
        }
    }
   
    @objc func didTapContinueButton(_ sender: UIButton) {
        switch showCase {
        case .registration:  performRegistration()
        case .login: performSignIn()
        default: print("Default")
        }
       
    }
    func performSignIn() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            print(authResult)
            print(error)
            
            if error != nil{
                self.showError(error: error!)
            }
            
        }
    }
    func performRegistration() {
        guard let email = emailTextField.text else {return}
        guard let password = secondPasswordTextField.text else {return}
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.user = authResult?.user
                self.saveToKeychain(email: email, password: password)
                self.didTapBackButton()
            }
            else {
                self.showError(error: error!)
            }
        }
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                return
            }
            print(error)
            print(authResult)
            print(Auth.auth().currentUser)
        }
    }
    
    func showError(error: Error) {
        passwordTextFieldLabel.text = error.localizedDescription
    }
    
}

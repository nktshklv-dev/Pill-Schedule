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
        hideProgressView()
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
        showProgressView()
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil{
                self.showError(error: error!)
                print(error)
            }
            
            guard let result = authResult else {return}
            self.setUser(authResult: result)
            self.didTapBackButton()
            print(authResult)
          

        }
    }
    func performRegistration() {
        guard let email = emailTextField.text else {return}
        guard let password = secondPasswordTextField.text else {return}
        print(email)
        print(password)
        showProgressView()
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.user = authResult?.user
                self.saveToKeychain(email: email, password: password)
                self.didTapBackButton()
                self.performSignIn()
            }
            else {
                self.showError(error: error!)
                print(error!)
            }
        }
    }
    func setUser(authResult: AuthDataResult) {
        self.parentView.user = authResult.user
        self.parentView.clearMainView()
        self.parentView.isLoggedIn = true
    }
    
    func showError(error: Error) {
        passwordTextFieldLabel.text = error.localizedDescription
    }
    
    func showProgressView(){
        spinningProgressView.alpha = 1
        spinningProgressView.startSpinning()
    }
    
    func hideProgressView() {
        spinningProgressView.alpha = 0
        spinningProgressView.stopSpinning()
    }
}

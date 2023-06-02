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
            continueButton.setTitleColor(.white, for: .normal)
        }
        else {
            continueButton.isUserInteractionEnabled = false
            continueButton.backgroundColor = R.color.gray2()
            continueButton.setTitleColor(R.color.dark(), for: .normal)
        }
    }
   
    @objc func didTapContinueButton(_ sender: UIButton) {
        switch showCase {
        case .registration:  performRegistration()
        case .login: performSignIn()
        default: print("Default")
        }
    }
    
    func showError(error: Error) {
        hideProgressView()
        let ac = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        window?.rootViewController?.present(ac, animated: true)
      
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

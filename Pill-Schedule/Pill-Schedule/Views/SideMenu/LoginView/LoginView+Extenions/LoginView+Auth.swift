//
//  LoginView+Auth.swift
//  Pills
//
//  Created by Nikita  on 5/23/23.
//

import Foundation
import FirebaseAuth

extension LogInView {
    
    func tryUserLogin(){
        let defaults = UserDefaults.standard
        var user: User?
        guard let userEmail = defaults.string(forKey: "userEmail") else {
            print("No email")
            return
        }
        print("User email: \(userEmail)")
        guard let passwordData = loadFromKeychain(account: userEmail) else {
            print("No password were found")
            return
        }
        print("password data: \(passwordData)")
        guard let password = String(data: passwordData, encoding: .utf8) else {
            return
        }
        print("Password: \(password)")
        
        signIn(email: userEmail, password: password)
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            print(authResult)
            print(error)
            guard error == nil else {
                return
            }
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
}

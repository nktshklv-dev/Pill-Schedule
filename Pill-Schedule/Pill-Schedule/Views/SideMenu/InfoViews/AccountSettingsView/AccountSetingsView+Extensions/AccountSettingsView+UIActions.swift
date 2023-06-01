//
//  AccountSettingsView+Actions.swift
//  Pills
//
//  Created by Nikita  on 5/5/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension AccountSettingsView {
    
    @objc func didTapLogInButton(_ sender: UIButton) {
        logInView.showCase = .login
        showLogInView()
    }
    @objc func didTapRegistrationButton(_ sender: UIButton) {
        logInView.showCase = .registration
        showLogInView()
    }

    @objc func hideLoginView(){
        hideLogInView()
    }

    private func showLogInView(){
        UIView.animate(withDuration: 0.35) {
            self.logInView.transform = CGAffineTransform(translationX: -365, y: 0)
            self.container.toggleBackButton(to: .invisible)
            self.container.gestureRecognizers?.remove(at: 0)
        }
    }
    
    private func hideLogInView(){
        UIView.animate(withDuration: 0.35) {
            self.logInView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.container.toggleBackButton(to: .visible)
            self.container.addSwipeGesture()
        }
    }
    
    
    func askToPerformSignOut() {
        let ac = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Log Out", style: .default) {
            _ in
            self.performSignOut()
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.window?.rootViewController?.present(ac, animated: true)
    }
    func performSignOut() {
        do {
            try Auth.auth().signOut()
            deleteLoginInfo()
            clearMainView()
            self.logOutButton.removeFromSuperview()
            self.isLoggedIn = false
            self.setupViews()
            self.setupConstraints()
        }
        catch {
            let ac = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.window?.rootViewController?.present(ac, animated: true)
        }
        print(Auth.auth().currentUser?.email)
       
    }
    
    func clearMainView() {
        mainView.removeFromSuperview()
    }
    
    func deleteLoginInfo() {
        let defaults = UserDefaults.standard
        
        guard let email = defaults.string(forKey: "userEmail") else {return}
        eraseEmailFromUserDefaults()
        erasePasswordFromKeychain(email: email)
    }
    func eraseEmailFromUserDefaults(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "userEmail")
    }
    func erasePasswordFromKeychain(email: String){
        deleteFromKeychain(account: email)
    }
    func deleteFromKeychain(account: String) {
        let service = "com.nktshklv.Pills"
        print("Account to delete: \(account)")
        let query: [CFString: Any] = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword]
        
        let status = SecItemDelete(query as CFDictionary)
        print("Deletion Result: \(status)")
    }
}

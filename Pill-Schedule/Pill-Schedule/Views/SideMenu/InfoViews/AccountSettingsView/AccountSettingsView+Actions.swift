//
//  AccountSettingsView+Actions.swift
//  Pills
//
//  Created by Nikita  on 5/5/23.
//

import Foundation
import UIKit
extension AccountSettingsView {
    //MARK: - About sender's tag
    /// Tag 1  ------------- Registration Button
    /// Tag 0 -------------- Login Button
    @objc func showLoginView(_ sender: UIButton){
        switch sender.tag {
        case 1:
            logInView.showCase = .registration
            showLogInView()
        case 0:
            logInView.showCase = .login
            showLogInView()
        default: print("Unknown sender's tag")
        }
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
}

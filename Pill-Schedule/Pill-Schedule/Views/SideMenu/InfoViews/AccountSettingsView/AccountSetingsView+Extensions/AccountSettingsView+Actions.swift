//
//  AccountSettingsView+Actions.swift
//  Pills
//
//  Created by Nikita  on 5/5/23.
//

import Foundation
import UIKit
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
}

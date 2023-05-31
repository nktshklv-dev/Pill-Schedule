//
//  BurgerMenuView+Actions.swift
//  Pills
//
//  Created by Nikita  on 4/30/23.
//

import Foundation
import UIKit

extension BurgerMenuView {
    
    func showContainerView() {
        UIView.animate(withDuration: 0.35, delay: 0) {
            self.infoContainerView.transform = CGAffineTransform(translationX: -365, y: 0)
            self.infoContainerView.alpha = 1
            self.collectionView.alpha = 0
            self.backButton.alpha = 0
        }
        for gesture in self.gestureRecognizers! {
            gesture.isEnabled = false
        }
        isContainerViewActive = true
    }
    
    @objc func hideContainerView() {
        UIView.animate(withDuration: 0.35, delay: 0) {
            self.infoContainerView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.infoContainerView.alpha = 0
            self.collectionView.alpha = 1
            self.backButton.alpha = 1
        }
        for gesture in self.gestureRecognizers! {
            gesture.isEnabled = true
        }
        isContainerViewActive = false
    }
    
}

//
//  ChoosePillButtonView+Actions.swift
//  Pills
//
//  Created by Nikita  on 4/19/23.
//

import Foundation
import UIKit

extension ChoosePillButtonView {
    
    @objc func didTapPillButton(_ sender: PillButton) {
        sender.tappedButton()
        uncheckButtons(sender: sender)
        self.currentSelectedPill = getPillType(sender)
        delegate?.didSelectPillImage(with: self.currentSelectedPill)
        if sender.isChecked {
            UIView.animate(withDuration: 0.2) {
                sender.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
            }
        }
        else {
            UIView.animate(withDuration: 0.2) {
                sender.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
        
    }
    
    
    func uncheckButtons(sender: PillButton) {
        let buttons = stackView.arrangedSubviews as [PillButton]
        if sender.isChecked {
            for button in buttons {
                button.isChecked = false
                UIView.animate(withDuration: 0.2) {
                    button.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                sender.isChecked = true
                UIView.animate(withDuration: 0.2) {
                    sender.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
                }
            }
        }
    }
    
    func getPillType(_ sender: PillButton) -> PillType? {
        guard let buttonImage = sender.imageView?.image else {return nil}
        guard sender.isChecked else {return nil}
        switch buttonImage {
        case R.image.pillButton():
            return .pillButton
        case R.image.capsuleButton():
            return .capsuleButton
        case R.image.ampouleButton():
            return .ampouleButton
        case R.image.inhalerButton():
            return .inhalerButton
        default:
            return nil
        }
    }
}

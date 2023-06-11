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
        print(buttons)
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
}

//
//  SecondCreatePillViewController+Delegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/11/23.
//

import Foundation
import UIKit

extension SecondCreatePillViewController {
    
    func removeReminder() {
        if reminderStackView.arrangedSubviews.count == 1 {
            guard let lastView = reminderStackView.arrangedSubviews.last as? ReminderView else {return}
            lastView.timerTextField.text = ""
            continueButton.isDisabled = true
            
        }
        
        if reminderStackView.arrangedSubviews.count != 1{
            guard let lastView = reminderStackView.arrangedSubviews.last else {return}
            UIView.animate(withDuration: 0.35) {
                lastView.alpha = 0
                self.reminderStackView.removeArrangedSubview(lastView)
                self.reminderStackViewHeight -= 44
                
                self.reminderStackView.snp.updateConstraints { make in
                    make.height.equalTo(self.reminderStackViewHeight)
                }
                if self.reminderStackView.arrangedSubviews.count > 1{
                    self.addReminderButton.alpha = 1
                    self.addReminderButton.isUserInteractionEnabled = true
                    self.promptLabel.alpha = 0
                }
                self.showLastDeleteButton()
                self.view.layoutIfNeeded()
            }
            guard let lastView = self.reminderStackView.arrangedSubviews.last as? ReminderView else {return}
            if lastView.timerTextField.text?.trimmingCharacters(in: .whitespaces) != "" {
                self.continueButton.isDisabled = false
            }
            
        }
        
    }
    
    func didSetTimeByDatePicker() {
        var hasEmpty = true
        for reminderView in reminderStackView.arrangedSubviews as [ReminderView] {
            guard let reminderViewText = reminderView.timerTextField.text else {return}
            if reminderViewText.trimmingCharacters(in: .whitespaces) == "" {
                hasEmpty = true
                return
            } else {
                hasEmpty = false
            }
        }
        
        if hasEmpty {
            continueButton.isDisabled = true
        } else {
            continueButton.isDisabled = false
        }
    }
}

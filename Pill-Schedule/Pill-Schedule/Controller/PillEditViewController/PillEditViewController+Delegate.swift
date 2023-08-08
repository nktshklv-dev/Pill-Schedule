//
//  PillEditViewController+Delegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/31/23.
//

import Foundation
import UIKit

extension PillEditViewController: RemindInViewDelegate {
    
    func didTapMinuteButton(value: Double) {
        self.remindInTime = value
        
        if self.remindInTime != editingPill.remindIntime {
            UIView.animate(withDuration: 0.35) {
                self.doneButton.setTitleColor(R.color.blue(), for: .normal)
                self.doneButton.isUserInteractionEnabled = true
            }
        } else {
            UIView.animate(withDuration: 0.35) {
                self.doneButton.setTitleColor(R.color.gray2(), for: .normal)
                self.doneButton.isUserInteractionEnabled = false
            }
        }
    }
}

extension PillEditViewController: ReminderViewDelegate {
    
    func removeReminder() {
        if reminderStackView.arrangedSubviews.count == 1 {
            guard let lastView = reminderStackView.arrangedSubviews.last as? ReminderView else {return}
            lastView.timerTextField.text = ""
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
            }
        }
        reloadReminderTimes()
        compareReminderTimes()
    }
    
    func didSetTimeByDatePicker(date: Date) {
        reloadReminderTimes()
        compareReminderTimes()
    }
    
    func compareReminderTimes() {
        print(reminderTimes)
        print(newReminderTimes)
        if reminderTimes != newReminderTimes {
            doneButton.setTitleColor(R.color.blue(), for: .normal)
            doneButton.isUserInteractionEnabled = true
        } else {
            doneButton.setTitleColor(R.color.gray2(), for: .normal)
            doneButton.isUserInteractionEnabled = false
        }
    }
    
}

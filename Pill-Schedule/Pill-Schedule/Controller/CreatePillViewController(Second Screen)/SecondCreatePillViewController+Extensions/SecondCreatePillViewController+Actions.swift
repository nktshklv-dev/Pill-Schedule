//
//  SecondCreatePillViewController+Actions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/11/23.
//

import Foundation
import UIKit

extension SecondCreatePillViewController {
    
    @objc func didTapContinueButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapAddReminderButton() {
        reminderStackViewHeight += 44
        let reminder = createReminder()
        UIView.animate(withDuration: 0.35) {
            self.reminderStackView.snp.updateConstraints { make in
                make.height.equalTo(self.reminderStackViewHeight)
            }
            self.addReminder(reminder: reminder)
            self.view.layoutIfNeeded()
        }
        continueButton.isDisabled = true
        
    }
    
    func addReminder(reminder: ReminderView) {
        if reminder.reminderNumber >= 3 {
            hideAddReminderButton()
            showReminderPrompt()
        }
        self.reminderStackView.addArrangedSubview(reminder)
    }
    
    func createReminder() -> ReminderView {
        let reminderView = ReminderView(frame: CGRect(x: 0, y: 0, width: width, height: 24))
        reminderView.reminderNumber = reminderStackView.arrangedSubviews.count + 1
        hideDeleteButtons()
        reminderView.deleteButton.alpha = 1
        reminderView.delegate = self
        return reminderView
    }
    
}

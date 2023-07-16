//
//  SecondCreatePillViewController+UIActions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/11/23.
//

import Foundation
import UIKit

extension SecondCreatePillViewController {
    
    
    func createReminder() -> ReminderView {
        requestNotification()
        let reminderView = ReminderView(frame: CGRect(x: 0, y: 0, width: width, height: 24))
        reminderView.reminderNumber = reminderStackView.arrangedSubviews.count + 1
        hideDeleteButtons()
        reminderView.deleteButton.alpha = 1
        reminderView.delegate = self
        return reminderView
    }
    
    
    
    func hideDeleteButtons() {
        for reminder in reminderStackView.arrangedSubviews as [ReminderView]{
            UIView.animate(withDuration: 0.35) {
                reminder.deleteButton.alpha = 0
                reminder.deleteButton.isUserInteractionEnabled = false
            }
            
        }
    }
    
    func showLastDeleteButton() {
        UIView.animate(withDuration: 0.35) {
            guard let lastReminder = self.reminderStackView.arrangedSubviews.last as? ReminderView else {return}
            lastReminder.deleteButton.alpha = 1
            lastReminder.deleteButton.isUserInteractionEnabled = true
        }
        
    }
    
    func hideAddReminderButton() {
        UIView.animate(withDuration: 0.5) {
            self.addReminderButton.alpha = 0
            self.addReminderButton.isUserInteractionEnabled = false
        }
    }
    
    func showReminderPrompt() {
        UIView.animate(withDuration: 1, animations: {
            self.promptLabel.alpha = 1
        })
        
    }
}

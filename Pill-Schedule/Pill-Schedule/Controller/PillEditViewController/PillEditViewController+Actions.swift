//
//  PillEditViewController+Actions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/31/23.
//

import Foundation
import UIKit

extension  PillEditViewController {
    
    @objc func didTapDoneButton() {
        
        saveMainReminderDates()
        var dates = mainReminderTimes
        if remindInView.switcher.isOn {
            saveCuttedReminderDates()
            dates = cuttedReminderTimes
        }
        
        deleteOldNotificationRequests()
        createNewNotificationRequests(with: dates)
        self.dismiss(animated: true)
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
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
    }
    
    func saveMainReminderDates() {
        for reminderView in reminderStackView.arrangedSubviews as [ReminderView] {
            guard let date = reminderView.reminderDate else {return}
            mainReminderTimes.append(date)
        }
    }
    
    func saveCuttedReminderDates() {
        for date in mainReminderTimes {
            let cuttedDate = date.addingTimeInterval(-(60.0 * remindInView.selectedMinutesViewValue))
            cuttedReminderTimes.append(cuttedDate)
        }
    }
    
    func deleteOldNotificationRequests() {
        let center = UNUserNotificationCenter.current()
        let identifiers = Array(editingPill.notificationID)
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    func createNewNotificationRequests(with dates: [Date]) {
        createTriggers(dates: dates)
    }
    
    func createTriggers(dates: [Date]) {
        var counterID = 0
        for date in dates {
            var components = DateComponents()
            var calendar = Calendar.current
            components.hour = calendar.component(.hour, from: date)
            components.minute = calendar.component(.minute, from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
            createRequest(with: trigger, id: counterID.description)
            counterID += 1
        }
    }
    
    func createRequest(with trigger: UNCalendarNotificationTrigger, id: String) {
        print(editingPill.id.description)
        let requestIdentifier = editingPill.id.description + id
        let center = UNUserNotificationCenter.current()
        let request = UNNotificationRequest(identifier: requestIdentifier, content: createNotification(), trigger: trigger)
        
        center.add(request)
    }
    
    func createNotification() -> UNMutableNotificationContent{
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "Time to take your medication!"
        var text = ""
        if remindInView.switcher.isOn {
            let minutes = Int(remindInView.selectedMinutesViewValue)
            text = "In \(minutes) minutes you need to take \(pillNameLabel.text!)."
        }
        else {
            text = "You need to take \"\(pillNameLabel.text!)\"."
        }
        notificationContent.body = text
        notificationContent.sound = .default
        notificationContent.badge = 1
        return notificationContent
    }
}

//
//  SecondCreatePillViewController+Actions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/11/23.
//

import Foundation
import UIKit
import RealmSwift

extension SecondCreatePillViewController {
    
    @objc func didTapContinueButton() {
        createPillObject()
        if remindInView.switcher.isOn {
            self.createLocalNotification(dates: cuttedReminderTimes)
        } else {
            createLocalNotification(dates: mainReminderTimes)
        }
      
        let vc = ViewController()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func createLocalNotification (dates: [Date]) {
        createTriggers(dates: dates)
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
    
    func createPillObject() {
        guard let name = pillNameLabel.text else {return}
        guard let description = pillInfoLabel.text else {return}
        guard let imageName = pillImageView.image else {return}
        let pill = Pill()
        pill.id = UUID().hashValue
        pill.pillDescription = description
        pill.name = name
        pill.imageName = self.pill.imageName
        self.pill = pill
        
        for i in 0...2{
            let id = pill.id.description + i.description
            pill.notificationID.append(id)
            print(pill.notificationID)
        }
       savePillObject(pill: pill)
        
    }


    
    func savePillObject(pill: Pill) {
        do {
            let realm = try Realm()
            print(pill.imageName)
            try realm.write {
                realm.add(pill)
            }
            
        } catch {
            print(error)
        }
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
        print(pill.id.description)
        let requestIdentifier = pill.id.description + id
        let center = UNUserNotificationCenter.current()
        let request = UNNotificationRequest(identifier: requestIdentifier, content: createNotification(), trigger: trigger)
        
        center.add(request)
    }
    
    func requestNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization( options: [.alert, .badge, .sound], completionHandler: { granted, error in
            
            if let error = error {
                print(error)
            }
        })
    }
    
}

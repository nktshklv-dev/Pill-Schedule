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
        let vc = ViewController()
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
    
    func createPillObject() {
        guard let name = pillNameLabel.text else {return}
        guard let description = pillInfoLabel.text else {return}
        guard let imageName = pillImageView.image else {return}
        let pill = Pill()
        pill.id = UUID().hashValue
        pill.pillDescription = description
        pill.name = name
        pill.imageName = self.pill.imageName
       savePillObject(pill: pill)
        
    }
    
    func createNotification() -> UNMutableNotificationContent{
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "It's time to take your medication!"
        notificationContent.body = "According to your schedule, it's time to take a medicine called \(pillNameLabel.text)"
        notificationContent.sound = .default
        return notificationContent
    }
    
    func createTrigger() {
        
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

    func requestNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization( options: [.alert, .badge, .sound], completionHandler: { granted, error in
            
            if let error = error {
                print(error)
            }
        })
    }
    
}

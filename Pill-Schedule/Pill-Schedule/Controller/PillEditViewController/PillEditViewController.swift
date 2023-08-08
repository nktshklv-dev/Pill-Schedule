//
//  PillEditView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/24/23.
//

import Foundation
import UIKit

class PillEditViewController : UIViewController {

    var editingPill: Pill!
    
    var titleLabel: UILabel!
    var verticalView: UIImageView!
    var pillImageView: UIImageView!
    var pillNameLabel: UILabel!
    var pillInfoLabel: UILabel!
    var reminderStackView: UIStackView!
    var addReminderButton: UIButton!
    var promptLabel: UILabel!
    var reminderStackViewHeight = 24
    var width: CGFloat = 0
    var remindInView: RemindInView!
    var doneButton: UIButton!
    var cancelButton: UIButton!
    var reminderTimes: [String] = []
    var newReminderTimes: [String] = []
    var remindInTime: Double = 0
    var mainReminderTimes = [Date]()
    var cuttedReminderTimes = [Date]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        checkReminderDates()
        self.width = self.view.frame.width
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    func checkReminderDates() {
        let dates = Array(editingPill.reminderTimes)
        if dates.count != 0 {
            for dateString in dates {
                guard let date = getDate(from: dateString) else {return}
                reminderTimes.append(date.formatted(date: .omitted, time: .shortened))
                print(reminderTimes)
            }
            newReminderTimes = reminderTimes
            fillReminderStackView()
        }
    }
    
   
    func reloadReminderTimes() {
        var arrangedSubviews = reminderStackView.arrangedSubviews as [ReminderView]
        newReminderTimes = [String]()
        for arrangedSubview in arrangedSubviews {
            guard let timerText = arrangedSubview.timerTextField.text else {return}
            print(timerText)
            newReminderTimes.append(timerText)
        }
    }
    
    
    func createReminder() -> ReminderView {
        let reminderView = ReminderView(frame: CGRect(x: 0, y: 0, width: width, height: 24))
        reminderView.reminderNumber = reminderStackView.arrangedSubviews.count + 1
        hideDeleteButtons()
        reminderView.deleteButton.alpha = 1
        reminderView.delegate = self
        return reminderView
    }
    
    func addReminder(reminder: ReminderView) {
        if reminder.reminderNumber >= 3 {
            hideAddReminderButton()
            showReminderPrompt()
        }
        self.reminderStackView.addArrangedSubview(reminder)
    }
    
    
    func addExistingReminder(reminder: ReminderView) {
        reminderStackViewHeight += 44
        UIView.animate(withDuration: 0.35) {
            self.reminderStackView.snp.updateConstraints { make in
                make.height.equalTo(self.reminderStackViewHeight)
            }
            self.addReminder(reminder: reminder)
            self.view.layoutIfNeeded()
        }
    }
    
    func checkRemindInView() {
        let minutes = editingPill.remindIntime
        remindInTime = minutes
        if minutes == 0.0 {
            return
        }
        else {
            remindInView.toggleSwitcher(isOn: true)
            remindInView.setMinutesViewValue(to: minutes)
        }
    }
    
    func getDate(from dateString: String) -> Date? {
        print(dateString)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let date = dateFormatter.date(from: dateString)
        return date
    }
}

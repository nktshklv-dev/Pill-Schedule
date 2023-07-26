//
//  PillEditView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/24/23.
//

import Foundation
import UIKit

class PillEditViewController : UIViewController, RemindInViewDelegate, ReminderViewDelegate {
    
    
    func didSetTimeByDatePicker(date: Date) {
        
    }
    
    func didTapMinuteButton(value: Double) {
        
    }
    
    
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
    var reminderTimes: [String] = []
    
    
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
            }
            fillReminderStackView()
        }
    }
    
    func fillReminderStackView() {
        for reminderText in reminderTimes {
            didTapAddReminderButton()
        }
        guard var reminderViews = reminderStackView.arrangedSubviews as? [ReminderView] else {return}
        
        for (index, reminderView) in reminderViews.enumerated() {
            reminderView.timerTextField.text = reminderTimes[index]
        }
    }
    
    
    @objc func didTapDoneButton() {
        
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        
        
        titleLabel = UILabel()
        titleLabel?.text = "Edit"
        titleLabel.textColor = R.color.dark()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        self.view.addSubview(titleLabel)
        
        verticalView = UIImageView()
        verticalView.image = R.image.rectangleView()
        self.view.addSubview(verticalView)
        
        pillImageView = UIImageView()
        pillImageView.contentMode = .scaleToFill
        pillImageView.image = editingPill.getPillImage()
        self.view.addSubview(pillImageView)
        
        pillNameLabel = UILabel()
        pillNameLabel.text = editingPill.name
        pillNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pillNameLabel.textColor = R.color.dark()
        self.view.addSubview(pillNameLabel)
        
        pillInfoLabel = UILabel()
        pillInfoLabel.text = editingPill.pillDescription
        pillInfoLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        pillInfoLabel.textColor = R.color.gray()
        self.view.addSubview(pillInfoLabel)
        
        
        reminderStackView = UIStackView()
        reminderStackView.axis = .vertical
        reminderStackView.distribution = .fillProportionally
        reminderStackView.spacing = 20
        self.view.addSubview(reminderStackView)
        
        addReminderButton = UIButton()
        addReminderButton.addTarget(self, action: #selector(didTapAddReminderButton), for: .touchUpInside)
        addReminderButton.setImage(R.image.addReminderButton(), for: .normal)
        self.view.addSubview(addReminderButton)
        
        promptLabel = UILabel()
        promptLabel.text = "You can only add up to 3 reminders"
        promptLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        promptLabel.textColor = R.color.gray2()
        promptLabel.alpha = 0
        self.view.addSubview(promptLabel)
        
        promptLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(reminderStackView.snp.bottom).offset(15)
        }
        
        
        remindInView = RemindInView()
        remindInView.delegate = self
        self.view.addSubview(remindInView)
        
        doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(R.color.blue(), for: .normal)
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.view.addSubview(doneButton)
        
    }
    
    
    
    func setupConstraints() {
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(30)
            make.left.equalTo(self.view).offset(24)
        }
        
        verticalView.snp.makeConstraints { make in
            make.left.equalTo(self.view).offset(14)
            make.top.equalTo(titleLabel.snp.bottom).offset(34)
        }
        
        pillImageView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.top.equalTo(verticalView)
            make.left.equalTo(verticalView.snp.right).offset(8)
        }
        
        pillNameLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.top.equalTo(pillImageView).offset(6)
            make.left.equalTo(pillImageView.snp.right).offset(8)
        }
        
        pillInfoLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalTo(pillImageView.snp.bottom).offset(-6)
            make.left.equalTo(pillNameLabel)
        }
        
        reminderStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(reminderStackViewHeight)
            make.top.equalTo(verticalView.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addReminderButton.snp.makeConstraints { make in
            make.height.width.equalTo(48)
            make.left.equalTo(reminderStackView).inset(24)
            make.top.equalTo(reminderStackView.snp.bottom).offset(20)
        }
        
        remindInView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.snp.bottom).inset(250)
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
    }
    
    func showLastDeleteButton() {
        UIView.animate(withDuration: 0.35) {
            guard let lastReminder = self.reminderStackView.arrangedSubviews.last as? ReminderView else {return}
            lastReminder.deleteButton.alpha = 1
            lastReminder.deleteButton.isUserInteractionEnabled = true
        }
        
    }
    
    func hideDeleteButtons() {
        for reminder in reminderStackView.arrangedSubviews as [ReminderView]{
            UIView.animate(withDuration: 0.35) {
                reminder.deleteButton.alpha = 0
                reminder.deleteButton.isUserInteractionEnabled = false
            }
            
        }
    }
    
    func addReminder(reminder: ReminderView) {
        if reminder.reminderNumber >= 3 {
            hideAddReminderButton()
            showReminderPrompt()
        }
        self.reminderStackView.addArrangedSubview(reminder)
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

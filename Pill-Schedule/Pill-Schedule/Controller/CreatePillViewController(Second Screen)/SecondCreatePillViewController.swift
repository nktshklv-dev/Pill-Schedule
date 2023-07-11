//
//  SecondCreatePillViewController.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/26/23.
//

import UIKit

class SecondCreatePillViewController: UIViewController, ReminderViewDelegate {
    
    var pageNumberLabel: UILabel!
    var titleLabel: UILabel!
    var verticalView: UIImageView!
    var pillImageView: UIImageView!
    var pillNameLabel: UILabel!
    var pillInfoLabel: UILabel!
    var pill: Pill!
    var reminderStackView: UIStackView!
    var addReminderButton: UIButton!
    var promptLabel: UILabel!
    var reminderStackViewHeight = 24
    var width: CGFloat = 0
    var remindInView: RemindInView!
    var continueButton: ContinueButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        self.width = self.view.frame.width
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        pageNumberLabel = UILabel()
        pageNumberLabel?.text = "2 of 2"
        pageNumberLabel?.textColor = R.color.gray()
        pageNumberLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.view.addSubview(pageNumberLabel)
        
        titleLabel = UILabel()
        titleLabel?.text = "Schedule"
        titleLabel.textColor = R.color.dark()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        self.view.addSubview(titleLabel)
        
        verticalView = UIImageView()
        verticalView.image = R.image.rectangleView()
        self.view.addSubview(verticalView)
        
        pillImageView = UIImageView()
        pillImageView.contentMode = .scaleToFill
        pillImageView.image = pill.image
        self.view.addSubview(pillImageView)
        
        pillNameLabel = UILabel()
        pillNameLabel.text = pill.name
        pillNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pillNameLabel.textColor = R.color.dark()
        self.view.addSubview(pillNameLabel)
        
        pillInfoLabel = UILabel()
        pillInfoLabel.text = pill.description
        pillInfoLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        pillInfoLabel.textColor = R.color.gray()
        self.view.addSubview(pillInfoLabel)
        
        continueButton = ContinueButton()
        continueButton.text = "Done"
        continueButton.isDisabled = true
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        self.view.addSubview(continueButton)
        
        reminderStackView = UIStackView()
        reminderStackView.axis = .vertical
        reminderStackView.distribution = .fillProportionally
        reminderStackView.spacing = 20
        self.view.addSubview(reminderStackView)
        let reminder = createReminder()
        addReminder(reminder: reminder)
        
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
        self.view.addSubview(remindInView)
        
    }
    
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
    
    
    
    func setupConstraints() {
        pageNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(pageNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(pageNumberLabel.snp.left)
        }
        
        verticalView.snp.makeConstraints { make in
            make.left.equalTo(self.view).offset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(44)
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
            make.top.equalTo(verticalView.snp.bottom).offset(44)
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
        
        continueButton.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(54)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom).offset(-44)
        }
    }
    
    
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

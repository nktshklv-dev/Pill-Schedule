//
//  SecondCreatePillViewController.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/26/23.
//

import UIKit

class SecondCreatePillViewController: UIViewController {

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
        
        reminderStackView = UIStackView()
        reminderStackView.axis = .vertical
        reminderStackView.distribution = .fillProportionally
        reminderStackView.spacing = 20
        self.view.addSubview(reminderStackView)
        addReminder()
        
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

        
    }
    
    @objc func didTapAddReminderButton() {
        reminderStackViewHeight += 44
        UIView.animate(withDuration: 0.35) {
            self.reminderStackView.snp.updateConstraints { make in
                make.height.equalTo(self.reminderStackViewHeight)
            }
            self.addReminder()
            self.view.layoutIfNeeded()
        }
        
    }
    
    func addReminder() {
        
        let reminderView = ReminderView(frame: CGRect(x: 0, y: 0, width: width, height: 24))
        reminderView.reminderNumber = reminderStackView.arrangedSubviews.count + 1
        
        if reminderView.reminderNumber >= 3 {
            hideAddReminderButton()
            showReminderPrompt()
        }
      
        self.reminderStackView.addArrangedSubview(reminderView)
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
            make.top.equalTo(reminderStackView.snp.bottom).offset(28)
        }
    }
}

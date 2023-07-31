//
//  PillEditViewController+CreateSubviews.swift
//  Pill-Schedule
//
//  Created by Nikita  on 7/31/23.
//

import Foundation
import UIKit

extension PillEditViewController {
    
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
        checkRemindInView()
        remindInView.delegate = self
        self.view.addSubview(remindInView)
        
        doneButton = UIButton()
        doneButton.setTitle("Save", for: .normal)
        doneButton.setTitleColor(R.color.gray2(), for: .normal)
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.view.addSubview(doneButton)
        
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(R.color.blue(), for: .normal)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        self.view.addSubview(cancelButton)
    }
    
    func setupConstraints() {
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(doneButton)
            make.left.equalTo(self.view).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(50)
            make.left.equalTo(self.view).offset(24)
        }
        
        verticalView.snp.makeConstraints { make in
            make.left.equalTo(self.view).offset(14)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
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
    
    
    
    
}

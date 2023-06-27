//
//  ReminderView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/27/23.
//

import UIKit

class ReminderView: UIView {

    var reminderNumberLabel: UILabel!
    var timerTextField: UITextField!
    var reminderNumber = 1 {
        didSet {
            reminderNumberLabel.text = "Reminder \(reminderNumber)"
        }
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        reminderNumberLabel = UILabel()
        reminderNumberLabel.text = "Reminder \(reminderNumber)"
        reminderNumberLabel.textColor = R.color.dark()
        reminderNumberLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.addSubview(reminderNumberLabel)
        
        timerTextField = UITextField()
        timerTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        timerTextField.placeholder = "00:00"
        timerTextField.textColor = R.color.dark()
        self.addSubview(timerTextField)
    }
    
    func setupConstraints() {
        reminderNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).inset(24)
        }
        
        timerTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).inset(24)
        }
    }
}

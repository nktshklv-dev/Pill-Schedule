//
//  ReminderView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/27/23.
//

import UIKit

class ReminderView: UIView {

   private var datePicker: UIDatePicker!
    var reminderDate = Date()
    var reminderNumberLabel: UILabel!
    var timerTextField: UITextField!
    var deleteButton: UIButton!
    var reminderNumber = 1 {
        didSet {
            reminderNumberLabel.text = "Reminder \(reminderNumber)"
        }
    }
    var delegate: ReminderViewDelegate! = nil
    
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
        
        deleteButton = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .small)
        let largeBoldMinusIcon = UIImage(systemName: "minus.circle", withConfiguration: symbolConfiguration)
        deleteButton.setImage(largeBoldMinusIcon, for: .normal)
        deleteButton.tintColor = R.color.orange()
        deleteButton.alpha = 0
        deleteButton.addTarget(self, action: #selector(didTapDeleteButon), for: .touchUpInside)
        self.addSubview(deleteButton)
        
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        timerTextField.inputView = datePicker
        timerTextField.inputAccessoryView = createToolbar()
    }
    
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    @objc func didTapDeleteButon() {
        delegate.removeReminder()
    }
    
    @objc func donePressed() {
        self.timerTextField.text = "\(datePicker.date.formatted(date: .omitted, time: .shortened))"
        self.reminderDate = datePicker.date
        self.endEditing(true)
    }
    func setupConstraints() {
        reminderNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).inset(24)
        }
        
        timerTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).inset(48)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).inset(15)
        }
    }
}

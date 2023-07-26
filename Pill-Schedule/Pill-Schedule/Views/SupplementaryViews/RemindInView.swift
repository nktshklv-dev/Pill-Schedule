//
//  RemindInView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/29/23.
//

import UIKit

class RemindInView: UIView {
    
    var titleLabel: UILabel!
    var switcher: UISwitch!
    var minutesStackView: UIStackView!
    var selectedMinutesViewValue = 5.0
    var delegate: RemindInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel = UILabel()
        titleLabel.text = "Remind in"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = R.color.dark()
        self.addSubview(titleLabel)
        
        switcher = UISwitch()
        switcher.onTintColor = R.color.blue()
        switcher.addTarget(self, action: #selector(didTapSwitcher), for: .touchUpInside)
        self.addSubview(switcher)
        
        minutesStackView = UIStackView()
        minutesStackView.axis = .horizontal
        minutesStackView.distribution = .fillProportionally
        minutesStackView.spacing = 24
        fillMinutesView()
        minutesStackView.isUserInteractionEnabled = false
        minutesStackView.alpha = 0
        self.addSubview(minutesStackView)
        
    }
    
   private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).inset(24)
        }
        
        switcher.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(self).inset(24)
        }
        
        minutesStackView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.right.equalTo(switcher)
            make.height.equalTo(30)
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
    
    private func fillMinutesView() {
        for i in 1...5 {
            let label = UIButton()
            label.setTitleColor(R.color.gray2(), for: .normal)
            label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            label.addTarget(self, action: #selector(didTapMinutesView), for: .touchUpInside)
            label.isUserInteractionEnabled = true
            switch i {
            case 1: label.setTitle("5 m", for: .normal)
            case 2: label.setTitle("10 m", for: .normal)
            case 3: label.setTitle("15 m", for: .normal)
            case 4: label.setTitle("20 m", for: .normal)
            case 5: label.setTitle("30 m", for: .normal)
            default: break
            }
            
            minutesStackView.addArrangedSubview(label)
            
        }
    }
    
     @objc private func didTapMinutesView(_ sender: UIButton) {
        deselectAll()
        sender.setTitleColor(R.color.dark(), for: .normal)
        var value = 5.0
        switch sender.titleLabel?.text {
        case "5 m": value = 5.0
        case "10 m": value = 10.0
        case "15 m": value = 15.0
        case "20 m": value = 20.0
        case "30 m": value = 30.0
        default: value = 5.0
            
        }
        selectedMinutesViewValue = value
        delegate?.didTapMinuteButton(value: value)
    }
    
    func toggleSwitcher(isOn: Bool) {
        switcher.isOn = isOn
        self.didTapSwitcher(switcher)
    }
    @objc private func didTapSwitcher(_ sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 0.35) {
                self.minutesStackView.isUserInteractionEnabled = true
                self.minutesStackView.transform = CGAffineTransform(translationX: 0, y: 28)
                self.minutesStackView.alpha = 1
            }
           
        }
        
        else {
            UIView.animate(withDuration: 0.35) {
                self.minutesStackView.isUserInteractionEnabled = false
                self.minutesStackView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.minutesStackView.alpha = 0
            }
           
        }
    }
    
    private func deselectAll() {
        for view in self.minutesStackView.arrangedSubviews as [UIButton]{
            view.setTitleColor(R.color.gray2(), for: .normal)
        }
       
    }
    
    func setMinutesViewValue(to minutes: Double) {
        self.selectedMinutesViewValue = minutes
        guard let arrangedSubviews = minutesStackView.arrangedSubviews as? [UIButton] else {return}
        var index = 0
        switch minutes {
        case 5.0: index = 0
        case 10.0: index = 1
        case 15.0: index = 2
        case 20.0: index = 3
        case 30.0: index = 4
        default:  print("default"); index = 0
        }
        didTapMinutesView(arrangedSubviews[index])
        
    }
}

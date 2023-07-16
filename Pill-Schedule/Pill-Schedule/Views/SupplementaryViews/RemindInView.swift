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
    var minutesView: UIStackView!
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
    
    func setupViews() {
        titleLabel = UILabel()
        titleLabel.text = "Remind in"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = R.color.dark()
        self.addSubview(titleLabel)
        
        switcher = UISwitch()
        switcher.onTintColor = R.color.blue()
        switcher.addTarget(self, action: #selector(didTapSwitcher), for: .touchUpInside)
        self.addSubview(switcher)
        
        minutesView = UIStackView()
        minutesView.axis = .horizontal
        minutesView.distribution = .fillProportionally
        minutesView.spacing = 24
        fillMinutesView()
        minutesView.isUserInteractionEnabled = false
        minutesView.alpha = 0
        self.addSubview(minutesView)
        
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).inset(24)
        }
        
        switcher.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(self).inset(24)
        }
        
        minutesView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.right.equalTo(switcher)
            make.height.equalTo(30)
            make.top.equalTo(titleLabel.snp.bottom)
        }
    }
    
    func fillMinutesView() {
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
            
            minutesView.addArrangedSubview(label)
            
        }
    }
    
    @objc func didTapMinutesView(_ sender: UIButton) {
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
    
    @objc func didTapSwitcher(_ sender: UISwitch) {
        if sender.isOn {
            UIView.animate(withDuration: 0.35) {
                self.minutesView.isUserInteractionEnabled = true
                self.minutesView.transform = CGAffineTransform(translationX: 0, y: 28)
                self.minutesView.alpha = 1
            }
           
        }
        
        else {
            UIView.animate(withDuration: 0.35) {
                self.minutesView.isUserInteractionEnabled = false
                self.minutesView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.minutesView.alpha = 0
            }
           
        }
    }
    
    func deselectAll() {
        for view in self.minutesView.arrangedSubviews as [UIButton]{
            view.setTitleColor(R.color.gray2(), for: .normal)
        }
       
    }
}

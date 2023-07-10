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
        titleLabel.text = "Reminders"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = R.color.dark()
        self.addSubview(titleLabel)
        
        switcher = UISwitch()
        switcher.onTintColor = R.color.blue()
        self.addSubview(switcher)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self).inset(24)
        }
        
        switcher.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self).inset(24)
        }
    }
    
    
    
}

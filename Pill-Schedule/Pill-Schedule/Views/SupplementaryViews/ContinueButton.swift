//
//  ContinueButton.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/15/23.
//

import UIKit

class ContinueButton: UIButton {

    var isDisabled: Bool = true {
        didSet {
            if isDisabled {
                disable()
            }
            else {
                enable()
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 16
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func disable() {
        self.isUserInteractionEnabled = false
        self.setTitle("Fill in the fields", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        UIView.animate(withDuration: 0.3) {
            self.setTitleColor(R.color.gray2(), for: .normal)
            self.backgroundColor = R.color.gray5()
        }
    }
    
    private func enable() {
        self.isUserInteractionEnabled = true 
        self.setTitle("Next", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        UIView.animate(withDuration: 0.3) {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = R.color.blue()
        }
    }
}

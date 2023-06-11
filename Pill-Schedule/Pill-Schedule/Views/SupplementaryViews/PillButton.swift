//
//  PillButton.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/11/23.
//

import Foundation
import UIKit

class PillButton: UIButton {
    
    private var checkmarkView: UIImageView!
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                checkmarkView.alpha = 1
            } else {
                checkmarkView.alpha = 0
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.adjustsImageWhenHighlighted = false
        self.setImage(R.image.pillButton(), for: .normal)
        
        checkmarkView = UIImageView()
        checkmarkView.image = R.image.checkmark()
        checkmarkView.alpha = 0
        self.addSubview(checkmarkView)
    }
    
    private func setupConstraints() {
        checkmarkView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
    func changeImage(to type: ChoosePillButtonView.PillType) {
        switch type {
        case .pillButton:
            self.setImage(R.image.pillButton(), for: .normal)
            break
        case .capsuleButton:
            self.setImage(R.image.capsuleButton(), for: .normal)
            break
        case .ampouleButton:
            self.setImage(R.image.ampouleButton(), for: .normal)
            break
        case .inhalerButton:
            self.setImage(R.image.inhalerButton(), for: .normal)
            break
        }
    }
    
    func tappedButton() {
        isChecked.toggle()
        if isChecked {
            checkmarkView.alpha = 1
        } else {
            checkmarkView.alpha = 0
        }
    }
}


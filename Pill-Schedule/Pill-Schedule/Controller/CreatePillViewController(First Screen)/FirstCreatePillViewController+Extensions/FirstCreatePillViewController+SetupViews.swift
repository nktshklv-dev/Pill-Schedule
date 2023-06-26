//
//  FirstCreatePillViewController+CreateSubviews.swift
//  Pills
//
//  Created by Nikita  on 4/17/23.
//

import Foundation
import UIKit

extension FirstCreatePillViewController {
    
    func setupViews(){
        pageNumberLabel = UILabel()
        pageNumberLabel.text = "1 of 2"
        pageNumberLabel.textColor = R.color.gray()
        pageNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        self.view.addSubview(pageNumberLabel)
        
        titleLabel = UILabel()
        titleLabel.text = "Add medication"
        titleLabel.textColor = R.color.dark()
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        self.view.addSubview(titleLabel)
        
        pillsView = ChoosePillButtonView()
        pillsView.delegate = self
        self.view.addSubview(pillsView)
        
        pillNameTextField = UITextField()
        pillNameTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pillNameTextField.placeholder = "Name"
        pillNameTextField.addTarget(self, action: #selector(pillNameTextFieldChanged), for: .allEditingEvents)
        pillNameTextField.textColor = R.color.dark()
        self.view.addSubview(pillNameTextField)
        
        pillDoseTextField = UITextField()
        pillDoseTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pillDoseTextField.placeholder = "Single dose, e.g. 1 tablet"
        pillDoseTextField.addTarget(self, action: #selector(pillDoseTextFieldChanged), for: .allEditingEvents)
        pillDoseTextField.textColor = R.color.dark()
        self.view.addSubview(pillDoseTextField)
        
        setupCollectionView()
        self.view.addSubview(timeStampCollectionView)
        
        continueButton = ContinueButton()
        continueButton.isDisabled = true
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        self.view.addSubview(continueButton)
    }
    
    func setupConstraints(){
        let width = UIScreen.main.bounds.width
        pageNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(pageNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(pageNumberLabel.snp.left)
        }
        
        pillsView.snp.makeConstraints { make in
            make.width.equalTo(self.view.snp.width).multipliedBy(0.9)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(74)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        pillNameTextField.snp.makeConstraints { make in
            make.width.equalTo(width - 48)
            make.height.equalTo(24)
            make.top.equalTo(pillsView.snp.bottom).offset(40)
            make.left.equalTo(self.view).offset(24)
        }
        
        pillDoseTextField.snp.makeConstraints { make in
            make.width.equalTo(width - 48)
            make.height.equalTo(24)
            make.top.equalTo(pillNameTextField.snp.bottom).offset(44)
            make.left.equalTo(self.view).offset(24)
        }
        
        timeStampCollectionView.snp.makeConstraints { make in
            make.width.equalTo(self.view).multipliedBy(0.98)
            make.height.equalTo(60)
            make.centerX.equalTo(self.view)
            make.top.equalTo(pillDoseTextField.snp.bottom).offset(36)
        }
        
        continueButton.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(54)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom).offset(-44)
        }
    }
}

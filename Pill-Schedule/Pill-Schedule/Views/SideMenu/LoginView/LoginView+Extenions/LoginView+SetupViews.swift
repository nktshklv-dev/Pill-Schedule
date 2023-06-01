//
//  LoginView+SetupViews.swift
//  Pills
//
//  Created by Nikita  on 5/7/23.
//

import Foundation
import UIKit

extension LogInView {
    
    func setupViews() {
        backButton = UIButton()
        backButton.setImage(R.image.backButton(), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        self.addSubview(backButton)
        switch showCase {
        case .login: setupLogInView()
        case .registration: setupRegistrationView()
        case .none: print("None")
        }
    }
   
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top).offset(53)
        }
        switch showCase {
        case .login: setupLoginConstrsaints()
        case .registration: setupRegistrationConstraints()
        case .none: print("None")
        }
    }
}

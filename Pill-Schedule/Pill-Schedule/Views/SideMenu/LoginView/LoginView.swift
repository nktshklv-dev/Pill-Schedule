//
//  LoginView.swift
//  Pills
//
//  Created by Nikita  on 5/5/23.
//

import UIKit
import FirebaseAuth
class LogInView: UIView {
    
    enum ShowCase {
        case registration
        case login
    }
    
    var showCase: ShowCase! {
        didSet {
            setupViews()
            setupConstraints()
        }
    }
    
    weak var parentView: AccountSettingsView!
    var promptLabel: UILabel!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var secondPasswordTextField: UITextField!
    var continueButton: UIButton!
    var backButton: UIButton!
    let width = UIScreen.main.bounds.width
    var emailTextFieldLabel: UILabel!
    var passwordTextFieldLabel: UILabel!
    var user: User!
    
    var emailFieldValid: Bool = false {
        didSet {
            openContinueButton()
        }
    }
    var passwordFieldsValid: Bool = false {
        didSet {
            openContinueButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = R.color.gray4()
        setupGestureRecognizer()
        Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
            }
        }
    }
    private func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }

   
    
}

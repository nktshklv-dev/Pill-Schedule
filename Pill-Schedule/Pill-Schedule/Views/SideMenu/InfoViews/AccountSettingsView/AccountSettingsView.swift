//
//  AccountSettingsView.swift
//  Pills
//
//  Created by Nikita  on 4/26/23.
//

import UIKit
import FirebaseAuth
class AccountSettingsView: UIView {
    
    var user: User?
    var userProfilePictureView: UIImageView!
    var userNameLabel: UILabel!
    var logInPromptLabel: UILabel!
    var alreadyHaveAnAccLabel: UILabel!
    var logInButton: UIButton!
    var registerButton: UIButton!
    var logOutButton: UIButton!
    var logInView: LogInView!
    var container: InfoContainerView!
    
    var loggedIn: Bool = false
    var handle: AuthStateDidChangeListenerHandle?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        if loggedIn {
            setupLoggedInView()
        }
        else {
            setupNotLoggedInView()
        }
    }
    func setupNotLoggedInView(){
        userProfilePictureView = UIImageView()
        userProfilePictureView.image = R.image.basicPP()
        userProfilePictureView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userProfilePictureView)
        
        userNameLabel = UILabel()
        userNameLabel.text = "You're not logged in :("
        userNameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        self.addSubview(userNameLabel)
        
        logInPromptLabel = UILabel()
        logInPromptLabel.text = "With an account in Pills, you will be able to store your data online."
        logInPromptLabel.numberOfLines = 0
        logInPromptLabel.textAlignment = .center
        logInPromptLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.addSubview(logInPromptLabel)
        
        registerButton = UIButton()
        registerButton.setTitle("Sign Up", for: .normal)
        registerButton.tag = 1
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = R.color.blue()
        registerButton.layer.cornerRadius = 21
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        registerButton.addTarget(self, action: #selector(showLoginView), for: .touchUpInside)
        self.addSubview(registerButton)
        
        alreadyHaveAnAccLabel = UILabel()
        alreadyHaveAnAccLabel.text = "Already have an account in Pills?"
        alreadyHaveAnAccLabel.textColor = R.color.gray()
        alreadyHaveAnAccLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        self.addSubview(alreadyHaveAnAccLabel)
        
        logInButton = UIButton()
        logInButton.setTitle("Sign In", for: .normal)
        logInButton.tag = 0
        logInButton.setTitleColor(R.color.blue(), for: .normal)
        logInButton.backgroundColor = UIColor(red: 0.67, green: 0.84, blue: 0.9, alpha: 0.3)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        logInButton.addTarget(self, action: #selector(showLoginView), for: .touchUpInside)
        logInButton.layer.cornerRadius = 20
        self.addSubview(logInButton)
        
        logInView = LogInView()
        logInView.parentView = self
        self.addSubview(logInView)
    }
    
    func setupLoggedInView(){
        
    }
    
    func setupConstraints() {
        if loggedIn {
            setupLoggedInConstraints()
        }
        else {
            setupNotLoggedInConstraints()
        }
            
    }
    func setupLoggedInConstraints() {
        
    }
    func setupNotLoggedInConstraints() {
        let width = UIScreen.main.bounds.width
        self.logInView.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.top.equalTo(self)
            make.left.equalTo(self.snp.right)
        }
        userProfilePictureView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(170)
            make.centerX.equalTo(self.snp.right).inset(width/2)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userProfilePictureView.snp.bottom).offset(15)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        logInPromptLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(20)
            make.width.equalTo(self).multipliedBy(0.8)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(42)
            make.top.equalTo(logInPromptLabel.snp.bottom).offset(20)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        alreadyHaveAnAccLabel.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(20)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
        
        logInButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(110)
            make.top.equalTo(alreadyHaveAnAccLabel.snp.bottom).offset(15)
            make.centerX.equalTo(userProfilePictureView.snp.centerX)
        }
    }
}

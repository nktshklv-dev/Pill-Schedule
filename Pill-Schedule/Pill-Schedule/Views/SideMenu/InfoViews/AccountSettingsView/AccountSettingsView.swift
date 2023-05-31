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
    var userSurnameLabel: UILabel!
    var logInPromptLabel: UILabel!
    var alreadyHaveAnAccLabel: UILabel!
    var logInButton: UIButton!
    var registerButton: UIButton!
    var logOutButton: UIButton!
    var editButton: UIButton!
    var logInView: LogInView!
    var container: InfoContainerView!
    
    var mainView: UIView!
    
    var loggedIn: Bool = true
    var handle: AuthStateDidChangeListenerHandle?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

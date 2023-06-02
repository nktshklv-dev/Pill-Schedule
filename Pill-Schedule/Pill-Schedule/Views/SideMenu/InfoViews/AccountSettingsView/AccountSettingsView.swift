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
    
    //Edit Mode props:
    var changeProfilePicButton: UIButton!
    var editNameTextField: UITextField!
    var editSurnameTextField: UITextField!
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Take a photo", image: UIImage(systemName: "camera"), handler: { action in
                print("camera")
            }),
            UIAction(title: "Choose from gallery", image: UIImage(systemName: "photo.on.rectangle.angled"), handler: { action in
                print("gallery")
            }),
            UIAction(title: "Remove", image: UIImage(systemName: "trash"), attributes: .destructive, handler: { action in
                print("trash")
            })]
    }
    var menu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    var mainView: UIView!
    
    var isLoggedIn: Bool = false {
        didSet {
          checkIfLoggedIn()
        }
    }
    var isEditing: Bool = false {
        didSet {
            toggledEditMode()
        }
    }
    var handle: AuthStateDidChangeListenerHandle?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        checkIfLoggedIn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkIfLoggedIn() {
        let user = Auth.auth().currentUser
        if user != nil {
            self.user = user
        }
        else {
            self.user = nil
        }
        setupViews()
        setupConstraints()
    }
}

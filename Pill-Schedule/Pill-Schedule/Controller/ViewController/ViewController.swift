//
//  ViewController.swift
//  Pills
//
//  Created by Nikita  on 3/8/23.
//

import UIKit
import SnapKit
import FirebaseAuth

class ViewController: UIViewController{
    
    var handle: AuthStateDidChangeListenerHandle?
    var user: User? {
        didSet {
            checkAccount()
        }
    }
    var mainView: UIView!
    var burgerMenuView: BurgerMenuView!
    var blurView: UIView!
    var dataSource: DataSource!
    var collectionView: UICollectionView!
    var plusButton: UIButton!
    private var rightConstraint = NSLayoutConstraint()
    
    var screenWidth: CGFloat {
        return view.bounds.width
    }
    var screenHeight: CGFloat {
        return view.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.gray4()
        setupCollectionView()
        setupViews()
        burgerMenuView.delegate = self
        setupConstraints()
        tryUserLogin()
    }
    
    func checkAccount() {
        print("User: \(user), email: \(user?.email)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener({ auth, user in
        })
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}


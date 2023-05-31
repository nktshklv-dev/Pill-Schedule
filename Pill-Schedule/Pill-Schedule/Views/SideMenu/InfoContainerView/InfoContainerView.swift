//
//  ContainerView.swift
//  Pills
//
//  Created by Nikita  on 4/30/23.
//

import UIKit

class InfoContainerView: UIView {
    
    enum ViewType {
        case account
        case general
        case vacCenters
        case about
        case null
    }
    enum BackButtonState{
        case visible
        case invisible
    }
    private var backButton: UIButton!
    var parentView: BurgerMenuView!
    private var viewToDisplay: UIView!
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        addSwipeGesture()
        setupConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        viewToDisplay = UIView()
        self.addSubview(viewToDisplay)
        self.backgroundColor = R.color.gray4()
        setupBackButton()
    }
    private func setupBackButton(){
        backButton = UIButton()
        backButton.setImage(R.image.backButton(), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        self.addSubview(backButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top).offset(53)
        }
        if viewToDisplay != nil {
            viewToDisplay.snp.makeConstraints { make in
                make.width.equalTo(self)
                make.height.equalTo(self)
                make.top.equalTo(self)
                make.left.equalTo(self)
            }
        }
       
    }
    func setupViewToDisplay(typeOf type: ViewType) {
        switch type {
        case .account:
            let displayView = AccountSettingsView()
            displayView.container = self
            viewToDisplay = displayView
        default:
            return
        }
        self.addSubview(viewToDisplay)
        setupBackButton()
        setupConstraints()
    }
    
     func addSwipeGesture(){
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(didTapBackButton))
        recognizer.direction = .right
        self.addGestureRecognizer(recognizer)
      
    }
    func clearContainer(){
        viewToDisplay.removeFromSuperview()
        backButton.removeFromSuperview()
        print(self.subviews)
    }
    
    func toggleBackButton(to state: BackButtonState){
        switch state {
        case .visible:
            backButton.alpha = 1
            backButton.isUserInteractionEnabled = true
        case .invisible:
            backButton.alpha = 0
            backButton.isUserInteractionEnabled = false
        }
    }
}

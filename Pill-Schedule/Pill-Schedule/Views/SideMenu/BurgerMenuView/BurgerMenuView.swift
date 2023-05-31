//
//  BurgerMenuView.swift
//  Pills
//
//  Created by Nikita  on 4/9/23.
//

import UIKit

class BurgerMenuView: UIView {
    
    var backButton = UIButton()
    var collectionView: UICollectionView!
    var delegate: MenuDelegate?
    var dataSource: DataSource!
    var infoContainerView: InfoContainerView!
    var isContainerViewActive: Bool = false
    var selectedType: InfoContainerView.ViewType = .null
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = R.color.gray4()
        collectionViewSetup()
        setupViews()
        setupConstraints()
        addSwipeGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSwipeGesture(){
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(didTapBackButton))
        recognizer.direction = .right
        self.addGestureRecognizer(recognizer)
    }
    
    @objc func didTapBackButton(){
        delegate?.hideMenu()
    }
}

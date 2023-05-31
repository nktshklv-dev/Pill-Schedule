//
//  BurgerMenuView+SetupViews.swift
//  Pills
//
//  Created by Nikita  on 4/12/23.
//

import Foundation
import UIKit

extension BurgerMenuView {
    
    func setupViews() {
        backButton = UIButton()
        backButton.setImage(R.image.backButton(), for: .normal)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        self.addSubview(backButton)
        
        self.addSubview(collectionView)
        
        infoContainerView = InfoContainerView()
        infoContainerView.parentView = self
        self.addSubview(infoContainerView)
    }
    
    func setupConstraints(){
        infoContainerView.snp.makeConstraints { make in
            make.width.equalTo(365)
            make.height.equalTo(self)
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right).offset(365)
        }
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top).offset(53)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(self.snp.top).offset(120)
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(176)
        }
    }
    
}

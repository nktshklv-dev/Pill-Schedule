//
//  ViewController+CreateSubviews.swift
//  Pills
//
//  Created by Nikita  on 4/9/23.
//

import Foundation
import UIKit

extension ViewController {

    func setupViews(){
        mainView = UIView()
        mainView.layer.masksToBounds = true
        mainView.backgroundColor = .white
        mainView.addSubview(collectionView)
        
        burgerMenuView = BurgerMenuView()
        blurView = setupBlurView()
        self.collectionView.addSubview(blurView)
        
        plusButton = AddPillButton()
        plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        mainView.addSubview(plusButton)
        
        self.view.addSubview(mainView)
        self.view.addSubview(burgerMenuView)
    }
    
     func setupConstraints(){
        guard let safeAreaTopHeight = UIApplication.shared.windows.first?.safeAreaInsets.top else { return }
        mainView.snp.makeConstraints { make in
             make.width.height.equalTo(self.view)
             make.left.equalTo(self.view)
             make.top.equalTo(self.view)
         }
        blurView.snp.makeConstraints { make in
            make.height.equalTo(safeAreaTopHeight)
            make.width.equalTo(screenWidth)
            make.top.equalTo(self.view.snp.top)
            make.leading.equalTo(self.view.snp.leading)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.view.snp.trailing).inset(20)
            make.bottom.equalTo(self.view.safeAreaInsets.bottom).inset(20)
        }
         burgerMenuView.snp.makeConstraints { make in
             make.width.equalTo(365)
             make.height.equalTo(self.view)
             make.top.equalTo(self.view)
             make.right.equalTo(self.view.snp.right).offset(365)
         }
    }
    
    func setupBlurView() -> UIView{
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
}

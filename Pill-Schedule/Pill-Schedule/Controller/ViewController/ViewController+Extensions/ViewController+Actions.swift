//
//  ViewController+DataSource.swift
//  Pills
//
//  Created by Nikita  on 4/3/23.
//

import Foundation
import UIKit

extension ViewController{
    @objc func didTapPlusButton(){
        let vc = FirstCreatePillViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: MenuDelegate {
    func showMenu() {
           UIView.animate(withDuration: 0.35, delay: 0) {
               self.blurView.alpha = 0
               self.burgerMenuView.alpha = 1
               self.burgerMenuView.snp.updateConstraints { make in
                   make.right.equalTo(self.view)
               }
               self.mainView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).concatenating( CGAffineTransform(translationX: -335, y: 0))
               self.mainView.layer.cornerRadius = 40
               self.view.layoutIfNeeded()
           }
          
       }
       func hideMenu() {
           UIView.animate(withDuration: 0.35, delay: 0) {
               self.blurView.alpha = 1
               self.burgerMenuView.alpha = 0
               self.burgerMenuView.snp.updateConstraints { make in
                   make.right.equalTo(self.view).offset(355)
               }
               self.mainView.transform = CGAffineTransform(translationX: 0, y: 0).concatenating(CGAffineTransform(scaleX: 1, y: 1))
               self.mainView.layer.cornerRadius = 0
               self.view.layoutIfNeeded()
           }
       }
}

extension ViewController: VaccinationMenuDelegate {
    
    func closeVaccinationMenu() {
        var oldSnap = dataSource.snapshot()
        oldSnap.deleteSections([.vaccinatedViewSection])
        dataSource.apply(oldSnap, animatingDifferences: true)
    }
}

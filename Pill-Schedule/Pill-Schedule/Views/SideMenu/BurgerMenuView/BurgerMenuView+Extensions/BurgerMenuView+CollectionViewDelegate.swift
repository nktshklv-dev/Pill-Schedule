//
//  BurgerMenuView+CollectionViewDelegate.swift
//  Pills
//
//  Created by Nikita  on 4/30/23.
//

import Foundation
import UIKit

extension BurgerMenuView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("case \(indexPath.item)")
        switch indexPath.item {
        case 0:
            showConfiguredContainerView(typeOf: .account)
        case 1:
            showConfiguredContainerView(typeOf: .null)
        case 2:
            showConfiguredContainerView(typeOf: .null)
        case 3:
            showConfiguredContainerView(typeOf: .null)
        default:
            return
        }
    }
    
    func showConfiguredContainerView(typeOf type: InfoContainerView.ViewType) {
        infoContainerView.clearContainer()
        infoContainerView.setupViewToDisplay(typeOf: type)
        showContainerView()
    }
}

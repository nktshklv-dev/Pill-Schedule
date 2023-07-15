//
//  ViewController+CollectionViewSetup.swift
//  Pills
//
//  Created by Nikita  on 3/31/23.
//

import Foundation
import UIKit

extension ViewController {
    func setupCollectionView(){
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(InfoViewCell.self, forCellWithReuseIdentifier: InfoViewCell.identifier)
        collectionView.register(VaccinationViewCell.self, forCellWithReuseIdentifier: VaccinationViewCell.identifier)
        collectionView.register(PillCell.self, forCellWithReuseIdentifier: PillCell.reuseIdentifier)
        collectionView.register(HeaderViewCell.self, forCellWithReuseIdentifier: HeaderViewCell.reuseIdentifier)
        self.dataSource = createDataSource() 
        collectionView.dataSource = dataSource
    }
}

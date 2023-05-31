//
//  BurgerMenuView+CollectionView.swift
//  Pills
//
//  Created by Nikita  on 4/12/23.
//

import Foundation
import UIKit

extension BurgerMenuView {
    func collectionViewSetup() {
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.showsSeparators = false
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout.list(using: config))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuViewCell.self, forCellWithReuseIdentifier: MenuViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = createDataSource()
        collectionView.isScrollEnabled = false
        
    }
}
extension BurgerMenuView {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func createDataSource() -> DataSource {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuViewCell.reuseIdentifier, for: indexPath) as? MenuViewCell
            cell?.titleText = item
            return cell
        })
       
        dataSource.apply(createSnapshot())
        return dataSource
    }
    
    private func createSnapshot() -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(["Account Settings", "General Settings", "Vaccination Centers", "About this App"])
        return snapshot
    }
}

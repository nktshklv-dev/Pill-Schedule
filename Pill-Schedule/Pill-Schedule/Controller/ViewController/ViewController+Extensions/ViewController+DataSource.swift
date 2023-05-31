//
//  ViewController+DataSource .swift
//  Pills
//
//  Created by Nikita  on 3/11/23.
//

import Foundation
import UIKit

extension ViewController{
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ItemView>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ItemView>
   
    func createDataSource() -> DataSource {
        dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            switch item {
            case .headerView:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderViewCell.reuseIdentifier, for: indexPath) as? HeaderViewCell else {return nil}
                cell.delegate = self
                return cell
                case .infoView:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoViewCell.identifier, for: indexPath) as? InfoViewCell else { return nil }
                return cell
            case .vaccinationView:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VaccinationViewCell.identifier, for: indexPath) as? VaccinationViewCell else {return nil}
                cell.delegate = self
                return cell
                
            case .pillView(let pill):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PillCell.reuseIdentifier, for: indexPath) as? PillCell else {return nil}
                cell.setupCell(for: pill)
                return cell
            }
        }
        dataSource.apply(createSnapshot())
        return dataSource
    }
    
    func createSnapshot() -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.headerSection, .infoSection, .vaccinatedViewSection, .mainSection])
        snapshot.appendItems([ItemView.headerView], toSection: .headerSection)
        snapshot.appendItems([ItemView.infoView], toSection: .infoSection)
        snapshot.appendItems([ItemView.vaccinationView], toSection: .vaccinatedViewSection)
        for pill in Pill.mockPills{
            snapshot.appendItems([ItemView.pillView(pill)], toSection: .mainSection)
        }
        return snapshot
    }

}

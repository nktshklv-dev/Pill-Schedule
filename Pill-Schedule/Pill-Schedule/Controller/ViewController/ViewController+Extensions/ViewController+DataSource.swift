//
//  ViewController+DataSource .swift
//  Pills
//
//  Created by Nikita  on 3/11/23.
//

import Foundation
import UIKit
import RealmSwift

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
        let snapshot = createSnapshot()
        dataSource.apply(snapshot)
        return dataSource
    }
    
    func createSnapshot() -> Snapshot{
        print(dataSource)
        var snapshot = Snapshot()
        snapshot.appendSections([.headerSection, .infoSection, .vaccinatedViewSection, .mainSection])
        snapshot.appendItems([ItemView.headerView], toSection: .headerSection)
        snapshot.appendItems([ItemView.infoView], toSection: .infoSection)
        snapshot.appendItems([ItemView.vaccinationView], toSection: .vaccinatedViewSection)
        
        var pills: [Pill]!
        do {
            let realm = try Realm()
            
            pills = Array(realm.objects(Pill.self)).reversed()
            print(pills.count)
        } catch {
            print(error)
        }
        for pill in pills {
            print(pill.imageName)
            snapshot.appendItems([ItemView.pillView(pill)], toSection: .mainSection)
        }
        return snapshot
    }
    
    func reloadSnapshot(){
        
        guard let ds = self.dataSource else {
            print("data source nil")
            return
        }
        
        var snapshot = ds.snapshot()
    
        var pills: [Pill]!
        do {
            let realm = try Realm()
            pills = Array(realm.objects(Pill.self)).reversed()
            print(pills)
        } catch {
            print(error)
        }
        for pill in pills {
            snapshot.appendItems([ItemView.pillView(pill)])
        }

        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func deleteItemFromSnapshot(pill: Pill) {
        guard let ds = self.dataSource else {
            print("data source nil")
            return
        }
        var snapshot = ds.snapshot()
        
        snapshot.deleteItems([ItemView.pillView(pill)])
        
        dataSource.apply(snapshot)
    }

}

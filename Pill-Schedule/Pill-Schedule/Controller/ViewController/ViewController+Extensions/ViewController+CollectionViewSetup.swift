//
//  ViewController+CollectionViewSetup.swift
//  Pills
//
//  Created by Nikita  on 3/31/23.
//

import Foundation
import UIKit
import RealmSwift
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
        collectionView.delegate = self
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        if indexPath.section == 3 {
            let menu = configureContextMenu(indexPath: indexPath)
            return menu
        }
        return nil
         
       }
    
    
    func configureContextMenu(indexPath: IndexPath) -> UIContextMenuConfiguration{
            let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
                
                let edit = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                    print("edit button clicked")
                }
                let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil,attributes: .destructive, state: .off) { (_) in
                    print("delete button clicked")
                    self.deleteSelectedPill(indexPath: indexPath)
                }
                
                return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.singleSelection, children: [edit,delete])
                
            }
            return context
        }
    
    func deleteSelectedPill(indexPath: IndexPath) {
        let row = indexPath.row
        
        do {
            let realm = try Realm()
            var pills = Array(realm.objects(Pill.self).reversed())
            print(pills.count)
            
            var selectedPill = pills[row]
            deleteItemFromSnapshot(pill: selectedPill)
            deleteNotifications(for: selectedPill)
            try realm.write({
                realm.delete(selectedPill)
            })
            pills = Array(realm.objects(Pill.self).reversed())
        } catch {
            print(error)
        }
    }
    
    func deleteNotifications(for pill: Pill) {
        let center = UNUserNotificationCenter.current()
        let ids = Array(pill.notificationID)
        center.removePendingNotificationRequests(withIdentifiers: ids)
    }
    
}

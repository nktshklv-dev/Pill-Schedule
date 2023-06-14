//
//  FirstCreatePillViewController+CollectionView.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/14/23.
//

import Foundation
import UIKit

extension FirstCreatePillViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimestampCollectionViewCell.reuseIdentifier, for: indexPath) as! TimestampCollectionViewCell
        cell.frame.size.height = 40
        cell.frame.size.width = 150
        
        let timestamp = timestamps[indexPath.row]
        cell.myLabel.text = timestamp.title
        if timestamp.isSelected{
            cell.changeState(isChosen: true)
        }
        else{
            cell.changeState(isChosen: false)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var recentSelectedItemId = 0
        for (id, item) in timestamps.enumerated(){
            if item.isSelected{
                recentSelectedItemId = id
            }
            else {
                continue
            }
        }
        
        if recentSelectedItemId == indexPath.row{
            return
        }
        else {
            timestamps[recentSelectedItemId].isSelected.toggle()
            timestamps[indexPath.row].isSelected.toggle()
        }
        collectionView.reloadData()
    }
}


//
//  ViewController+Layout.swift
//  Pills
//
//  Created by Nikita  on 3/31/23.
//

import Foundation
import UIKit
extension ViewController {
     func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let currentSection = Section(rawValue: sectionIndex)
            let currentSize = currentSection?.getSize()
            var width = currentSize!.0
            let height = currentSize!.1
            
            if currentSection == .headerSection {
                width = layoutEnvironment.container.contentSize.width
            }
            
            let size = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height))
            let item = NSCollectionLayoutItem(layoutSize: size)
            
            var groupHeight: CGFloat = 0
            switch currentSection{
            case .infoSection: groupHeight = (currentSection?.getSize().1)!
            case .vaccinatedViewSection: groupHeight = (currentSection?.getSize().1)!
            case .mainSection: groupHeight = (currentSection?.getSize().1)!
            case .headerSection: groupHeight = (currentSection?.getSize().1)!
            default: return nil
            }
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(groupHeight))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            switch currentSection{
            case .mainSection: group.edgeSpacing = .init(leading: .none, top: .fixed(16), trailing: .none, bottom: .none)
            case .vaccinatedViewSection:  group.edgeSpacing = .init(leading: .none, top: .fixed(15), trailing: .none, bottom: .fixed(10))
            case .infoSection:  group.edgeSpacing = .init(leading: .none, top: .fixed(16), trailing: .none, bottom: .none)
            default:  group.edgeSpacing = .init(leading: .none, top: .none, trailing: .none, bottom: .none)
            }
            
          
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
              top: 0,
              leading: layoutEnvironment.container.contentSize.width/12,
              bottom: 0,
              trailing: layoutEnvironment.container.contentSize.width/4
            )
            return section
        }
        return layout
    }
}

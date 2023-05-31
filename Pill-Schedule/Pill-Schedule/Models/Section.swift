//
//  Section.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation

enum Section: Int, CaseIterable {
    
    case headerSection
    case infoSection
    case vaccinatedViewSection
    case mainSection
  
    func getSize() -> (CGFloat, CGFloat) {
        switch self {
            case .infoSection: return (327, 126)
            case .vaccinatedViewSection: return (327, 101)
            case .mainSection: return (327, 100)
            case .headerSection:  return (0, 90)
            default: return (0,0)
        }
    }
}

enum MenuSection: Int, CaseIterable {
    case accountHelperSection
    case listSection
}

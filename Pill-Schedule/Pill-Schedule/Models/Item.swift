//
//  Item.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation


enum ItemView: Hashable {
    case headerView
    case infoView
    case vaccinationView
    case pillView(Pill)
}

enum MenuItemView: Hashable {
    case accountHelperView
    case listItem
}




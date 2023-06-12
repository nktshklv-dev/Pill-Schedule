//
//  HeaderViewCell+Actions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/12/23.
//

import Foundation
import UIKit

extension HeaderViewCell {
    
    func getUserName() -> String {
        let defaults = UserDefaults.standard
        guard let name = defaults.string(forKey: "userName") else {
            return "User"
        }
        return name
    }
}

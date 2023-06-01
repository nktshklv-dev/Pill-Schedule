//
//  AccountSettingsView+SetupViews.swift
//  Pill-Schedule
//
//  Created by Nikita  on 5/31/23.
//

import Foundation
import UIKit

extension AccountSettingsView {
    
    func setupViews() {
        if isLoggedIn {
            setupLoggedInView()
        }
        else {
            setupNotLoggedInView()
        }
    }
    
    func setupConstraints() {
        if isLoggedIn {
            setupLoggedInConstraints()
        }
        else {
            setupNotLoggedInConstraints()
        }
            
    }
}

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
        if loggedIn {
            setupLoggedInView()
        }
        else {
            setupNotLoggedInView()
        }
    }
    
    func setupConstraints() {
        if loggedIn {
            setupLoggedInConstraints()
        }
        else {
            setupNotLoggedInConstraints()
        }
            
    }
}

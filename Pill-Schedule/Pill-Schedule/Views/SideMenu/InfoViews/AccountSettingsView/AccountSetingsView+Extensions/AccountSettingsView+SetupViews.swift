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
        if user != nil {
            setupLoggedInView()
        }
        else {
            setupNotLoggedInView()
        }
    }
    
    func setupConstraints() {
        if user != nil {
            setupLoggedInConstraints()
        }
        else {
            setupNotLoggedInConstraints()
        }
            
    }
}

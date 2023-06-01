//
//  AccountSettingsView+ButtonActions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/1/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension AccountSettingsView {
    
    @objc func didTapLogOut(_ sender: UIButton) {
        askToPerformSignOut()
       
    }
}

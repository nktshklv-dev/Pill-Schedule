//
//  AccountSettingsView+TextFieldDelegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/7/23.
//

import Foundation
import UIKit
 
extension AccountSettingsView: UITextFieldDelegate{
    
    @objc func didChangeNameTextField(_ sender: UITextField) {
        guard var rawName = sender.text else {return}
        guard !rawName.isEmpty else {rawName = "User" ; return}
        var trimmedName = rawName.trimmingCharacters(in: .whitespaces)
        
        saveUserNameLocally(name: trimmedName)
        saveUserNameRemote(name: trimmedName)
        
    }
    
    @objc func didChangeSurnameTextField(_ sender: UITextField) {
        guard var rawSurname = sender.text else {return}
        guard !rawSurname.isEmpty else {rawSurname = " " ; return}
        var trimmedSurname = rawSurname.trimmingCharacters(in: .whitespaces)
        
        saveUserSurnameLocally(surname: trimmedSurname)
        saveUserSurnameRemote(surname: trimmedSurname)
    }
}

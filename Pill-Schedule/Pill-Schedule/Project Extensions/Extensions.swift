//
//  Extensions.swift
//  Pills
//
//  Created by Nikita  on 5/5/23.
//

import Foundation
import UIKit
import RealmSwift

//MARK: - String Extensions
extension String {
    enum ValidityType {
        case email
        case password
    }
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,12}$"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
    
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}

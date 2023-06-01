//
//  LoginView+Security.swift
//  Pills
//
//  Created by Nikita  on 5/18/23.
//

import Foundation
import Security
import FirebaseAuth

extension LogInView {
    
    func saveToKeychain(email: String, password: String) {
        let service = "com.nktshklv.Pills"
        
        guard let passwordData = password.data(using: .utf8) else {
            print("Converting password into data error")
            return
        }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: email,
            kSecValueData as String: passwordData]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Saving password into keychain error: \(status)")
        }
        saveEmailtoUserDefaults(email: email)
        print(status)
    }
    
    
    func saveEmailtoUserDefaults(email: String){
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "userEmail")
    }
}

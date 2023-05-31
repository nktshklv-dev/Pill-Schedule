//
//  LoginView+Auth.swift
//  Pills
//
//  Created by Nikita  on 5/23/23.
//

import Foundation
import FirebaseAuth

extension LogInView {
    
    func tryUserLogin(){
        let defaults = UserDefaults.standard
        var user: User?
        guard let userEmail = defaults.string(forKey: "userEmail") else {
            print("No email")
            return
        }
        print("User email: \(userEmail)")
        guard let passwordData = loadFromKeychain(account: userEmail) else {
            print("No password were found")
            return
        }
        print("password data: \(passwordData)")
        guard let password = String(data: passwordData, encoding: .utf8) else {
            return
        }
        print("Password: \(password)")
        
        signIn(email: userEmail, password: password)
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            print(authResult)
            print(error)
            guard error == nil else {
                return
            }
        }
    }
    
    func loadFromKeychain(account: String) -> Data? {
        let service = "com.nktshklv.Pills"
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            return result as? Data
        } else {
            print("Ошибка загрузки данных из Keychain: \(status)")
            return nil
        }
    }
}

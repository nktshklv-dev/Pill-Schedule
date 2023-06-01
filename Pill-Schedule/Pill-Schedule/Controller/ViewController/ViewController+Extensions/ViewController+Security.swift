//
//  ViewController+Security.swift
//  Pills
//
//  Created by Nikita  on 5/18/23.
//

import Foundation
import Security
import FirebaseAuth

extension ViewController {
    func checkKeychainData() {
        let service = "com.nktshklv.Pills" // Идентификатор службы (замените на свое значение)
        let account = "nikitashakalov@gmail.com" // Аккаунт данных, которые вы хотите проверить
        
        if let data = loadFromKeychain(account: account) {
            if let password = String(data: data, encoding: .utf8) {
                print("Данные в Keychain найдены: \(password)")
            } else {
                print("Ошибка преобразования данных в строку")
            }
        } else {
            print("Данные в Keychain не найдены")
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
    
    func deleteFromKeychain(account: String) {
        let service = "com.nktshklv.Pills"
        print("Account to delete: \(account)")
        let query: [CFString: Any] = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword]
        
        let status = SecItemDelete(query as CFDictionary)
        print("Deletion Result: \(status)")
    }
    
    func tryUserLogin(){
        print(Auth.auth().currentUser?.email)
        let defaults = UserDefaults.standard
        var result: AuthDataResult? = nil
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
    func setUser(user: User?) {
        self.user = user
    }
    
    func signIn(email: String, password: String){
        var dataResult: AuthDataResult? = nil
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            print(authResult)
            print(error)
            guard error == nil else {
                print(error?.localizedDescription)
                self.eraseEmailFromUserDefaults()
                self.erasePasswordFromKeychain(email: email)
                self.setUser(user: nil)
                return
            }
            dataResult = authResult
            guard let user = dataResult?.user else {return}
            self.setUser(user: user)
        }
    }
    
    func eraseEmailFromUserDefaults(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "userEmail")
    }
    func erasePasswordFromKeychain(email: String){
        deleteFromKeychain(account: email)
    }
}





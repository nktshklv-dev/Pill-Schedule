//
//  AccountSettingsView+StorageActions.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/2/23.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import UIKit
import FirebaseCore
import FirebaseDatabase

extension AccountSettingsView {
    
    func saveUserProfilePicRemote(image img: UIImage?) {
        guard let image = img else {return}
        guard let uid = Auth.auth().currentUser?.uid else {return} 
        guard let imageData = image.jpegData(compressionQuality: 1) else {return}
        
        let profileImgReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
        let uploadTask = profileImgReference.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func retrieveUserProfilePicRemote() -> UIImage?{
        showProgressSpinner()
        guard let uid = Auth.auth().currentUser?.uid else {return nil}
        var returnImage: UIImage?
        let profileImageReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
        let downloadTask = profileImageReference.getData(maxSize: 1 * 1024 * 1024) { retrievedData, error in
            if let error = error {
                print(error.localizedDescription)
                self.userProfilePictureView.image = R.image.basicPP()
                self.hideProgressSpinner()
                return
            }
            
            if let data = retrievedData {
                guard var image = UIImage(data: data) else {return}
                returnImage = image
                return
            } else {
                self.userProfilePictureView.image = R.image.basicPP()
            }
            self.hideProgressSpinner()
        }
        return returnImage
    }
    
    func saveProfilePictureLocally(image img: UIImage?) {
        guard let image = img else {return}
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        guard let userID = Auth.auth().currentUser?.uid else {return}
        let url = path.appendingPathComponent("\(userID).jpg")
        
        do {
            let imageData = image.jpegData(compressionQuality: 1)
            try imageData?.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func retrieveProfilePictureLocally() -> UIImage? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        guard let userID = Auth.auth().currentUser?.uid else {return nil}
        let url = path.appendingPathComponent("\(userID).jpg")
        
        do {
            let imageData = try Data(contentsOf: url)
            let image = UIImage(data: imageData)
            userProfilePictureView.image = image
            return image
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func saveUserNameRemote(name: String) {
        guard let userUID = Auth.auth().currentUser?.uid else {return}
        let rootRef = Database.database(url: "https://pill-schedule-76e16-default-rtdb.europe-west1.firebasedatabase.app").reference().child("users").child("\(userUID)")
        let nameRef = rootRef.child("userName")
       
        nameRef.setValue(name)
    }
    
    func saveUserSurnameRemote(surname: String) {
        guard let userUID = Auth.auth().currentUser?.uid else {return}
        let rootRef = Database.database(url: "https://pill-schedule-76e16-default-rtdb.europe-west1.firebasedatabase.app").reference().child("users").child("\(userUID)")
        let surnameRef = rootRef.child("userSurname")
        surnameRef.setValue(surname)
    }
    
    func loadUserNameRemote() -> String?{
        var userName: String?
        
        guard let userUID = Auth.auth().currentUser?.uid else {return nil}
        let rootRef = Database.database(url: "https://pill-schedule-76e16-default-rtdb.europe-west1.firebasedatabase.app").reference().child("users").child(userUID)
        
        rootRef.child("userName").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            let name = snapshot?.value as? String
            userName = name
        }
    
        
        print(userName)
        return userName
    }
    func loadUserSurnameRemote() -> String?{
        var userSurname: String?
        guard let userUID = Auth.auth().currentUser?.uid else {return nil}
        let rootRef = Database.database(url: "https://pill-schedule-76e16-default-rtdb.europe-west1.firebasedatabase.app").reference().child("users").child(userUID)
        
        rootRef.child("userSurname").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            let surname = snapshot?.value as? String
            userSurname = surname
        }
    
        return userSurname
        }
    
    
    func saveUserNameLocally(name: String?) {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "userName")
    }
    
    func saveUserSurnameLocally(surname: String?) {
        let defaults = UserDefaults.standard
        
        defaults.set(surname, forKey: "userSurname")
    }
    
    func loadUserNameLocally() -> String? {
        let defaults = UserDefaults.standard
    
        guard let name = defaults.string(forKey: "userName") else {return nil}
        return name
    }
    
    func loadUserSurnameLocally() -> String? {
        let defaults = UserDefaults.standard
        
        guard let surname = defaults.string(forKey: "userSurname") else {return nil}
        return surname
    }
}

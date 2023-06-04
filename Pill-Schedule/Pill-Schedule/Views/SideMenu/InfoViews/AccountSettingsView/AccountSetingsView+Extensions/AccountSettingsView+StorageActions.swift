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

extension AccountSettingsView {
    
    func uploadUserProfilePic() {
        guard let pic = userProfilePictureView.image else {return}
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let imageData = pic.jpegData(compressionQuality: 0.5) else {return}
        
        let profileImgReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
        let uploadTask = profileImgReference.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func retrieveUserProfilePic() {
        showProgressSpinner()
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let profileImageReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
        let downloadTask = profileImageReference.getData(maxSize: 1 * 1024 * 1024) { retrievedData, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = retrievedData {
                self.userProfilePictureView.image = UIImage(data: data)
            } else {
                self.userProfilePictureView.image = R.image.basicPP()
            }
            self.hideProgressSpinner()
        }
    }
}

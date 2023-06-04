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
        guard let pic = profilePicture else {return}
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
    
    func retrieveUserProfilePic() -> UIImage?{
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
    
    func saveProfilePictureLocally(image: UIImage) {
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
    
    func loadProfilePictureLocally() -> UIImage? {
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
}

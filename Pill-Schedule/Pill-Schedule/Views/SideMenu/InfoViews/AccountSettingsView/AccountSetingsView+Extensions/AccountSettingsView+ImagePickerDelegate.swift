//
//  AccountSettingsView+ImagePickerDelegate.swift
//  Pill-Schedule
//
//  Created by Nikita  on 6/2/23.
//

import Foundation
import UIKit

extension AccountSettingsView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        setProfilePicture(picture: image)
        uploadUserProfilePic()
        self.window?.rootViewController?.dismiss(animated: true)
    }
}

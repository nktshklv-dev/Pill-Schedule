//
//  Pill.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation
import UIKit
import RealmSwift

class Pill: Object {
    
    @Persisted(primaryKey: true) var id = 0
    @Persisted var name: String = ""
    @Persisted var imageType: ChoosePillButtonView.PillType = .pill
    @Persisted var pillDescription: String = ""
    @Persisted var imageName: String = ""
    @Persisted var notificationID = List<String>()
    @Persisted var reminderTimes = List<String>()
    
//    init(name: String, imageType: ChoosePillButtonView.PillType, description: String) {
//        self.id = UUID()
//        self.name = name
//        self.imageType = imageType
//        self.pillDescription = description
//    }
    
    func getPillImage() -> UIImage? {
        let name = self.imageName
        switch name {
        case "pill": return R.image.pill()
        case "ampoule": return R.image.ampoule()
        case "inhaler": return R.image.inhaler()
        case "capsule": return R.image.capsule()
        default: return R.image.pill()
        }
    }
}

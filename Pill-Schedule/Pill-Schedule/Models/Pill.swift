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
    
    static var mockPills =
    [Pill(name: "First Pill", imageType: .pill, description: "First pill description"),
     Pill(name: "Second Pill", imageType: .capsule, description: "second pill description"),
     Pill(name: "Third Pill", imageType: .ampoule, description: "Third pill description"),
    Pill(name: "Fourth Pill", imageType: .inhaler, description: "Fourth pill description")]
    
    @Persisted var id: UUID
    @Persisted var name: String
    @Persisted var imageType: ChoosePillButtonView.PillType
    @Persisted  var pillDescription: String
    @Persisted var imageName: String
    
    init(name: String, imageType: ChoosePillButtonView.PillType, description: String) {
        self.id = UUID()
        self.name = name
        self.imageType = imageType
        self.pillDescription = description
    }
    
    func getPillImage() -> UIImage? {
        let name = self.imageName
        switch name {
        case "pill": return R.image.pill()
        case "ampoule": return R.image.ampoule()
        case "inhaler": return R.image.inhaler()
        case "capsule": return R.image.capsule()
        default: return nil
        }
    }
}

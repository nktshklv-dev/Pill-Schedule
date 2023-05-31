//
//  Pill.swift
//  Pills
//
//  Created by Nikita  on 3/10/23.
//

import Foundation

class Pill: Equatable, Hashable {
    
    static var mockPills =
    [Pill(name: "First Pill", imageType: .pill, description: "First pill description"),
    Pill(name: "Second Pill", imageType: .capsule, description: "second pill description"),
    Pill(name: "Third Pill", imageType: .ampoule, description: "Third pill description"),
    Pill(name: "Fourth Pill", imageType: .inhaler, description: "Fourth pill description")]
    
    var id: UUID
    var name: String
    var imageType: PillImageType
    var description: String
    
    init(name: String, imageType: PillImageType, description: String) {
        self.id = UUID()
        self.name = name
        self.imageType = imageType
        self.description = description
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Pill, rhs: Pill) -> Bool {
        return lhs.id == rhs.id
    }
}

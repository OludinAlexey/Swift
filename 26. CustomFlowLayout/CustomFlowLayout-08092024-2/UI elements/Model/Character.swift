//
//  Characters.swift
//  UI elements
//
//  Created by Алексей Олудин on 10.08.2024.
//

class Character {
    
    let name: String
    var photoName: String
    let description: String
    let side: Side
    
    
    init(name: String, photoName: String, side: Side, description: String) {
        self.name = name
        self.photoName = photoName
        self.description = description
        self.side = side
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
    }
}


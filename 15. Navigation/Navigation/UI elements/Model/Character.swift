//
//  Characters.swift
//  UI elements
//
//  Created by Алексей Олудин on 10.08.2024.
//

class Character: Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }
    
    private let _name: String
    private var _photoName: String
    private let _description: String
    
    var name: String {
        get {
            return _name
        }
    }
    
    var photoName: String {
        get{
            return _photoName
        }
    }
    
    var description: String {
        get {
            return _description
        }
    }
    
    
    init(name: String, photoName: String, description: String) {
        self._name = name
        self._photoName = photoName
        self._description = description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
    }
}

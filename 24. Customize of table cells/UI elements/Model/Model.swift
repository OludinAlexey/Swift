//
//  Model.swift
//  UI elements
//
//  Created by Алексей Олудин on 10.08.2024.
//

import Foundation

class Model {
    var characters: [Character] = []
    
    
    init() {
        characters.append(Character(name: "Neo", photoName: "neo", side: Side.Hero, description: "Neo is the main protagonist of The Matrix trilogy and a returning protagonist of The Matrix Resurrections. He is a Redpill Resistance operative of the hovercraft Nebuchadnezzar and is prophecized by The Oracle to be The One - an individual capable of freeing the rest of humanity from their unsuspecting imprisonment within the Matrix"))
        characters.append(Character(name: "Morpheus", photoName: "morpheus", side: Side.Hero, description: "In the Matrix films, Morpheus is the captain of the Nebuchadnezzar, which is a hovercraft of the human forces of the last human city, Zion, in a devastated world where most humans are grown by sentient machines to be used as power sources and their minds kept imprisoned in the Matrix, a virtual computer-generated world, to stop them from realising the truth of the real world. Morpheus was once a human living inside the Matrix until he was freed."))
        characters.append(Character(name: "Trinity", photoName: "trinity", side: Side.Hero, description: "Like the series' other main characters, Trinity is a computer programmer and a hacker who has escaped from the Matrix, a sophisticated computer program where most humans are imprisoned. Though few specifics are revealed about her previous life inside the Matrix, it is told that she cracked a database so secure that she is famous among hackers, and that Morpheus, one of a number of real-world hovercraft commanders, initially identified her and helped her escape from the program. At the beginning of the series, she is first mate on Morpheus' Nebuchadnezzar and serves mainly as a go-between for him and the individuals he wishes to free from the Matrix. As the series progresses, her primary importance as a character becomes her close relationship with Neo. She is skilled with computers, at operating vehicles both inside and outside the Matrix, and in martial arts."))
        characters.append(Character(name: "Smith", photoName: "smith", side: Side.Villain, description: "Agent Smith is a former Agent of the Matrix. After initially being destroyed by Neo, he became an Exile and manifested as a computer virus with the uncanny ability to copy himself over the minds of Bluepills, Redpills and programs alike. He is the main antagonist of the first three The Matrix films before being resurrected by The Analyst in the The Matrix Resurrections. The resurrected Smith carries strong resentment towards The Analyst and, upon recovery of his memories, pragmatically chooses to let both Neo and Trinity live in favor of prioritizing the downfall of The Analyst. "))
    }
    
    
    init(character: Character) {
        self.characters.append(character)
    }
    
    func getHeroesNumber() -> Int {
        var i: Int = 0
        
        for character in characters {
            if character.side == Side.Hero {i += 1}
        }
        
        return i
    }
    
    func getVillainNumber() -> Int {
        var i: Int = 0
        
        for character in characters {
            if character.side == Side.Villain {i += 1}
        }
        
        return i
    }
    
    func getUniqueSideNumber() -> Int {
        var uniqueSides: [Side] = []
        
        for character in characters {
            if !uniqueSides.contains(character.side){
                uniqueSides.append(character.side)
            }
        }
        
        return uniqueSides.count
    }
}



//
//  Model.swift
//  UI elements
//
//  Created by Алексей Олудин on 10.08.2024.
//

import Foundation

struct Model {
    var characters: [Character] = []
    var charactersToAdd: [Character] = []
    
    init() {
        characters.append(
            Character(
                name: "Neo",
                photoName: "neo",
                side: Side.Hero,
                description: "Neo is the main protagonist of The Matrix trilogy and a returning protagonist of The Matrix Resurrections. He is a Redpill Resistance operative of the hovercraft Nebuchadnezzar and is prophecized by The Oracle to be The One - an individual capable of freeing the rest of humanity from their unsuspecting imprisonment within the Matrix"
            )
        )
        
        characters.append(
            Character(
                name: "Morpheus",
                photoName: "morpheus",
                side: Side.Hero,
                description: "In the Matrix films, Morpheus is the captain of the Nebuchadnezzar, which is a hovercraft of the human forces of the last human city, Zion, in a devastated world where most humans are grown by sentient machines to be used as power sources and their minds kept imprisoned in the Matrix, a virtual computer-generated world, to stop them from realising the truth of the real world. Morpheus was once a human living inside the Matrix until he was freed."
            )
        )
        
        characters.append(
            Character(
                name: "Trinity",
                photoName: "trinity",
                side: Side.Hero,
                description: "Like the series' other main characters, Trinity is a computer programmer and a hacker who has escaped from the Matrix, a sophisticated computer program where most humans are imprisoned. Though few specifics are revealed about her previous life inside the Matrix, it is told that she cracked a database so secure that she is famous among hackers, and that Morpheus, one of a number of real-world hovercraft commanders, initially identified her and helped her escape from the program. At the beginning of the series, she is first mate on Morpheus' Nebuchadnezzar and serves mainly as a go-between for him and the individuals he wishes to free from the Matrix. As the series progresses, her primary importance as a character becomes her close relationship with Neo. She is skilled with computers, at operating vehicles both inside and outside the Matrix, and in martial arts."
            )
        )
        
        characters.append(
            Character(
                name: "Smith",
                photoName: "smith",
                side: Side.Villain,
                description: "Agent Smith is a former Agent of the Matrix. After initially being destroyed by Neo, he became an Exile and manifested as a computer virus with the uncanny ability to copy himself over the minds of Bluepills, Redpills and programs alike. He is the main antagonist of the first three The Matrix films before being resurrected by The Analyst in the The Matrix Resurrections. The resurrected Smith carries strong resentment towards The Analyst and, upon recovery of his memories, pragmatically chooses to let both Neo and Trinity live in favor of prioritizing the downfall of The Analyst. "
            )
        )
        
        characters.append(
            Character(
                name: "Tank",
                photoName: "tank",
                side: .Hero,
                description: "Tank was the operator of the Nebuchadnezzar. He was born naturally in Zion, brother to Dozer and Zee, and died young, sometime between his final appearance in The Matrix and the start of The Matrix Reloaded, of unspecified causes. He is succeeded in his shipboard duties by Link. Tank is played by Marcus Chong. Tank's muscular body makes him feel like he's tough as a tank, hence the reason he named himself Tank."
            )
        )
        
        characters.append(
            Character(
                name: "Dozer",
                photoName: "dozer",
                side: .Hero,
                description: "Dozer was a crew member of the Nebuchadnezzar who appeared to do double duty as its pilot and in a health and wellness capacity. He was born naturally in Zion, brother of Tank and Zee[1], and died aboard the ship[2]. He was survived by his widow, Cas, and their two children. He was played by Anthony Ray Parker. "
            )
        )
        
        characters.append(
            Character(
                name: "Dujour",
                photoName: "dujour",
                side: .Other,
                description: "Dujour (also known as the White Rabbit Girl) was a young woman in Goth apparel who visited Neo with her boyfriend, Choi, at his apartment to pick up some illegal software that Neo wrote in his spare time for extra money. She is portrayed in The Matrix by Australian actress Ada Nicodemou."
            )
        )
        
        
        
        
        charactersToAdd.append(
            Character(
                name: "Oracle (Pifia)",
                photoName: "oracle",
                side: .Other,
                description: "In the first film, the Oracle is depicted as a cheerful old lady who smokes cigarettes and bakes cookies. She possesses the power of foresight, which she uses to advise and guide the humans attempting to fight the Matrix. Later, she is revealed to be a sapient program who is integral to the very nature of the Matrix itself. "
            )
        )
        
        charactersToAdd.append(
            Character(
                name: "Cypher",
                photoName: "cypher",
                side: .Villain,
                description: "Cypher (born Reagan) was a redpill assigned to the Zion hovercraft Nebuchadnezzar under the command of Morpheus. He also betrayed the crew of the Nebuchadnezzar to aid Agent Smith and help him acquire information about the Zion mainframe. He is the hidden secondary antagonist in The Matrix."
            )
        )
        
        charactersToAdd.append(
            Character(
                name: "Mouse",
                photoName: "mouse",
                side: .Hero,
                description: "Mouse appears to be the youngest and most diminutive crew member on the Zion hovercraft Nebuchadnezzar. He is a pod-born zionite and is later killed by S.W.A.T. gunfire within the Matrix. He is played by the Australian actor, Matt Doran. "
            )
        )
    }
    
    
    init(characters: [Character]) {
        for character in characters {
            self.characters.append(character)
        }
    }
    
    
    init(initWithoutCharacters: Bool){
        
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
    
    func getOthersNumber() -> Int {
        var i: Int = 0
        
        for character in characters {
            if character.side == Side.Other {i += 1}
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
    
    typealias SideRawValue = Int
    func getSideCharactersNumber(_ sideRawValue: SideRawValue) -> Int {
        switch sideRawValue {
        case 0: return self.getHeroesNumber()
        case 1: return self.getVillainNumber()
        case 2: return self.getOthersNumber()
        default: break
        }
        return 0
    }
}


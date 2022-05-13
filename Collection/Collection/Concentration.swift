//
//  Concentration.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 13.05.2022.
//

import Foundation

class Concentration {
    var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: - shuffle
    }
    
    func chooseCard(at index: Int) {
        
    }
}

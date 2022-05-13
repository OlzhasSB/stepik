//
//  Card.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 13.05.2022.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (ihs: Card, rhs: Card) -> Bool {
        ihs.identifier == rhs.identifier
    }
}

//
//  Concentration.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 13.05.2022.
//

import Foundation

protocol ConcentrationDelegate: AnyObject {
    func didUpdateCount(with count: Int)
}

class Concentration {
    private(set) var cards: [Card] = []
    
    weak var delegate: ConcentrationDelegate?
    private var flipCount = 0 {
        didSet {
            delegate?.didUpdateCount(with: flipCount)
        }
    }
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardsIndices.count == 1 ? faceUpCardsIndices.first : nil
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: - shuffle
    }
    
    func chooseCard(at index: Int) {
        guard !cards[index].isMatched else { return }
        flipCount += 1
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            // 1 card is face up
            if cards[matchIndex] == cards[index] {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFaceUp = true
        } else {
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
}

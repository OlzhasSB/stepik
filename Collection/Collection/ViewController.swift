//
//  ViewController.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game: Concentration = {
        let game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        game.delegate = self
        return game
    }()

    @IBOutlet private var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var emojiChoices = ["👻", "🎩", "☠️", "🦾", "🧶", "😁"]
    private var emojiesCache = Dictionary<Card, String>()
    
    @IBAction private func touchCard(_ sender: UIButton) {
        guard let index = cardButtons.firstIndex(of: sender) else { return }
        //flipCard(emojiChoices[index], sender: sender)
        game.chooseCard(at: index)
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(getEmoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    private func getEmoji(for card: Card) -> String {
        if let emoji =  emojiesCache[card] {
            return emoji
        } else {
            guard let randomIndex = emojiChoices.indices.randomElement() else { return "?"}
            let emoji = emojiChoices.remove(at: randomIndex)
            emojiesCache[card] = emoji
            return emoji
        }
    }
}

extension ViewController: ConcentrationDelegate {
    func didUpdateCount(with count: Int) {
        flipCountLabel.text = "Flips: \(count)"
    }
}

//
//  ViewController.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    @IBOutlet var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["👻","🎩","👻","🎩"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        guard let index = cardButtons.firstIndex(of: sender) else { return }
        //flipCard(emojiChoices[index], sender: sender)
        game.chooseCard(at: index)
        updateViewFromModel()
        flipCount += 1
    }
    
    func updateViewFromModel() {
        
    }
    
    func flipCard(_ emoji: String, sender: UIButton) {
        if sender.currentTitle == emoji {
            sender.setTitle("", for: .normal)
            sender.backgroundColor = .orange
        } else {
            sender.setTitle(emoji, for: .normal)
            sender.backgroundColor = .white
        }
    }
    
}


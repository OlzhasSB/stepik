//
//  ViewController.swift
//  Collection
//
//  Created by Olzhas Seiilkhanov on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func touchCard(_ sender: UIButton) {
        flipCard("👻", sender: sender)
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard("🎩", sender: sender)
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


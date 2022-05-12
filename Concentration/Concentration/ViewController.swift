//
//  ViewController.swift
//  Concentration
//
//  Created by Olzhas Seiilkhanov on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func touchCard(_ sender: UIButton) {
        
    }
    
    func flipCard(_ emoji: String, sender: UIButton){
        
        if sender.currentTitle == emoji {
            sender.setTitle("", for: .normal)
            
        }
        
    }
    
}


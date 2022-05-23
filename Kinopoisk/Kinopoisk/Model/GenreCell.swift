//
//  GenreCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 20.05.2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    @IBOutlet var genreButton: UIButton!
    
    func setUp(with genre: Genre) {
        genreButton.setTitle(genre.text, for: .normal)
    }
    
}

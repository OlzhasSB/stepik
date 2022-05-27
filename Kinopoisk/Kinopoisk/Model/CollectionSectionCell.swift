//
//  CollectionSectionCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit

class CollectionSectionCell: UICollectionViewCell {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    func setUp(with temp: Movie) {
        posterImageView.image = temp.posterPath
        genreLabel.text = temp.voteAverage
        titleLabel.text = temp.title
    }
}

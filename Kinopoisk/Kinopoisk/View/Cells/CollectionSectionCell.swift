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
    @IBOutlet var ratingLabel: UILabel!
    
    func setUp(with movie: Movie) {
        genreLabel.text = "Action, Comedy"
        
        NetworkManager.shared.loadImage(with: movie.posterPath ?? "", completion: { [weak self] imageData in
            self?.posterImageView.image = UIImage(data: imageData)
        })
        
        titleLabel.text = movie.originalTitle
        ratingLabel.text = "★" + String(format: "%.1f", movie.voteAverage!)
        
        if movie.voteAverage! < 4 {
            ratingLabel.backgroundColor = UIColor.systemRed
        } else if movie.voteAverage! < 7 {
            ratingLabel.backgroundColor = UIColor.systemOrange
        } else {
            ratingLabel.backgroundColor = UIColor.systemGreen
        }
        
        //genreLabel.text = getGenres(by: movie.genreIds, genres: genres)
        
    }
    
    func getGenres(by ids: [Int], genres: [Genre]) -> String? {
        var array: [String] = []
        for id in ids {
            array.append(genres.first { $0.id == id }?.name ?? "")
        }
        return array.joined(separator: ", ")
    }
    
}

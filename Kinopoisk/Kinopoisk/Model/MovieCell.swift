//
//  MovieCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLable: UILabel!
    @IBOutlet var movieDateLabel: UILabel!
    @IBOutlet var movieRating: UILabel!
    
    func setUp(with movie: Movie) {
        movieImageView.image = movie.posterPath
        movieTitleLable.text = movie.title
        movieDateLabel.text = movie.releaseDate
        movieRating.text = movie.voteAverage
    }
}

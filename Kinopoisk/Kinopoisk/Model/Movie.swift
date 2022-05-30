//
//  Movies.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

struct Movie {
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPatch = "poster_path"
        case genrelIds = "genre_ids"
    }
    
    let title: String?
    let releaseDate: String?
    let voteAverage: String?
    let posterPath: UIImage?
    let details: String?
    let poster: UIImage?
    let actors: [Cast]?
}

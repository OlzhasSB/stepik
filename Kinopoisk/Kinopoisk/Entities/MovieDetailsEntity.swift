//
//  Movies.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
    }
    let id: Int
    let originalTitle: String?
    let releaseDate: String?
    let voteAverage: Double?
    let posterPath: String?
    let genreIds: [Int]
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}

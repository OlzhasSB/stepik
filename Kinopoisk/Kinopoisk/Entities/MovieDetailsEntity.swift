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
    let posterUrl: String?
    let genreIds: [Int]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        originalTitle = try? container.decodeIfPresent(String.self, forKey: .originalTitle)
        releaseDate = try? container.decodeIfPresent(String.self, forKey: .releaseDate)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        if let posterPath = try? container.decodeIfPresent(String.self, forKey: .posterPath) {
            self.posterUrl = "https://image.tmdb.org/t/p/w200\(posterPath)"
        } else {
            posterUrl = nil
        }
        genreIds = try container.decode([Int].self, forKey: .genreIds)
    }
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}

//
//  MoviesDetailsResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 25.09.2021.
//

import Foundation

struct MoviesDetailsResponseModel: Codable {
    let posterPath: String
    let voteAverage: Double
    let title: String
    let genres: [GenresForMoviesResponseModel]
    let runtime: Int
    let releaseDate: String
    let overview: String

    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case title = "title"
        case genres = "genres"
        case runtime = "runtime"
        case releaseDate = "release_date"
        case overview = "overview"
    }
}

struct GenresForMoviesResponseModel: Codable {
    let id: Int
    let name: String
}

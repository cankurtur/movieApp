//
//  MoviesModel.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation

struct PopularMoviesResponseModel: Codable {
    let page: Int
    let results: [MovieResponseModel]
    let totalPages: Int
    let totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResponseModel: Codable {
    let id: Int
    let posterPath: String
    let title: String
    let releaseDate: String
    let voteAverage: Double
    let genreIds: [Int]

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case title = "title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
}

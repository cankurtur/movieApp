//
//  NowPlayingResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 15.09.2021.
//

import Foundation

struct NowPlayingMoviesResponseModel: Codable {
    let page: Int
    let results: [NowPlayingResponseModel]
    let totalPages: Int
    let totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct NowPlayingResponseModel: Codable {
    let id: Int
    let posterPath: String
    let title: String
    let voteAverage: Double
    let genreIds: [Int]

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case title = "title"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
}

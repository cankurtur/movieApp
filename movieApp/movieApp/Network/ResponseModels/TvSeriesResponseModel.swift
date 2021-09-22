//
//  TvSeriesResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 17.09.2021.
//

import Foundation

struct PopularTvSeriesResponseModel: Codable {
    let page: Int
    let results: [TvSeriesResponseModel]
}

struct TvSeriesResponseModel: Codable {
    let id: Int
    let posterPath: String
    let name: String
    let voteAverage: Double
    let genreIds: [Int]

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case name = "name"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
}

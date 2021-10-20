//
//  TopRatedSeriesResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 19.09.2021.
//

import Foundation

struct TopRatedSeriesResponseModel: Codable {
    let page: Int
    let results: [TopRatedResponseModel]
}

struct TopRatedResponseModel: Codable {
    let id: Int
    let posterPath: String
    let name: String
    let voteAverage: Double

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case name = "name"
        case voteAverage = "vote_average"
    }
}

//
//  MoviesModel.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation

struct PopularMoviesResponseModel: Decodable {
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

struct MovieResponseModel: Decodable {
    let adult: Bool
    let id: Int
    let title: String
}

//
//  TvSeriesGenreResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 17.09.2021.
//

import Foundation

struct TvSeriesGenreResponseModel: Codable {
    let genres: [GenresForTvSeriesResponseModel]
}

struct GenresForTvSeriesResponseModel: Codable {
    let id: Int
    let name: String
}

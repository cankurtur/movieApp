//
//  MultiSearchResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 28.09.2021.
//

import Foundation

struct MultiSearchResponseModel: Codable {
    let page: Int
    let results: [ResultsResponseModel]
}

struct ResultsResponseModel: Codable {
    let id: Int
    let mediaType: String
    let name: String
    let profilePath: String
    let posterPath: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case mediaType = "media_type"
        case name = "name"
        case profilePath = "profile_path"
        case posterPath = "poster_path"
    }
}

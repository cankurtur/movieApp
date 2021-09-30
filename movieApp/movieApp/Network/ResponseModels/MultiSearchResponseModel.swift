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
    let mediaType: MediaType
    let name: String?
    let title: String?
    let profilePath: String?
    let posterPath: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case mediaType = "media_type"
        case name = "name"
        case title = "title"
        case profilePath = "profile_path"
        case posterPath = "poster_path"
    }
}

enum MediaType: String, Codable {
    case movieType = "movie"
    case tvType = "tv"
    case personType = "person"
}
